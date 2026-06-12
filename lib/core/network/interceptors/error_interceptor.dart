import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../error/exceptions.dart';

@lazySingleton
class ErrorInterceptor extends Interceptor {
  String _parseMessage(Response? response, String fallback) {
    try {
      final data = response?.data;
      if (data is Map<String, dynamic>) {
        final error = data['error'];
        if (error is Map<String, dynamic>) {
          return error['message'] ?? fallback;
        }
        return data['message'] ?? fallback;
      }
    } catch (_) {}
    return fallback;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final response = err.response;
    final message = _parseMessage(response, err.message ?? 'Unknown error');
    Exception exception;

    switch (response?.statusCode) {
      case 400:
        exception = ServerException(message: message);
        break;
      case 401:
        exception = UnauthorizedException(message: message);
        break;
      case 403:
        exception = ForbiddenException(message: message);
        break;
      case 404:
        exception = NotFoundException(message: message);
        break;
      case 422:
        exception = ValidationException(
          message: message,
          errors: response?.data,
        );
        break;
      case 500:
      case 501:
      case 502:
      case 503:
        exception = ServerException(message: message);
        break;
      default:
        exception = UnknownException(message: message);
    }

    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: response,
        error: exception,
        type: err.type,
        message: message,
      ),
    );
  }
}
