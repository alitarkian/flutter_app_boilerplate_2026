import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../config/app_config.dart';

@lazySingleton
class LoggingInterceptor extends Interceptor {
  final AppConfig config;

  LoggingInterceptor(this.config);

  PrettyDioLogger get logger => PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 120,
      );

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    if (config.enableLogs) {
      logger.onRequest(options, handler);
    }

    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    if (config.enableLogs) {
      logger.onResponse(response, handler);
    }

    handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    if (config.enableLogs) {
      logger.onError(err, handler);
    }

    handler.next(err);
  }
}