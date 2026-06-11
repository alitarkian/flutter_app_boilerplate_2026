import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../error/exceptions.dart';

@lazySingleton
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Exception exception;

    switch (err.response?.statusCode) {
      case 400:
        exception = ServerException(message: 'Bad request');
        break;

      case 401:
        exception = UnauthorizedException(message: 'Unauthorized');
        break;

      case 403:
        exception = ForbiddenException(message: 'Forbidden');
        break;

      case 404:
        exception = NotFoundException(message: 'Resource not found');
        break;

      case 422:
        exception = ValidationException(
          message: 'Validation error',
          errors: err.response?.data,
        );
        break;

      case 500:
      case 501:
      case 502:
      case 503:
        exception = ServerException(message: 'Server error');
        break;

      default:
        exception = UnknownException(message: err.message ?? 'Unknown error');
    }

    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        error: exception,
        type: err.type,
        message: err.message,
      ),
    );
  }
}
