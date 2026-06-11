import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RetryInterceptor extends Interceptor {
  static const int maxRetry = 3;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final shouldRetry =
        err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout;

    if (!shouldRetry) {
      return handler.next(err);
    }

    final retryCount = (err.requestOptions.extra['retry_count'] as int?) ?? 0;

    if (retryCount >= maxRetry) {
      return handler.next(err);
    }

    err.requestOptions.extra['retry_count'] = retryCount + 1;

    await Future.delayed(Duration(seconds: retryCount + 1));

    try {
      final dio = Dio();

      final response = await dio.fetch(err.requestOptions);

      handler.resolve(response);
    } catch (_) {
      handler.next(err);
    }
  }
}
