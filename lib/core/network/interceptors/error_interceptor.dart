import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../error/exceptions.dart';

@lazySingleton
class ErrorInterceptor extends Interceptor {
  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    switch (err.response?.statusCode) {
      case 400:
        throw ServerException(
          message: 'Bad request',
        );

      case 401:
        throw UnauthorizedException(
          message: 'Unauthorized',
        );

      case 403:
        throw ForbiddenException(
          message: 'Forbidden',
        );

      case 404:
        throw NotFoundException(
          message: 'Resource not found',
        );

      case 422:
        throw ValidationException(
          message: 'Validation error',
          errors: err.response?.data,
        );

      case 500:
      case 501:
      case 502:
      case 503:
        throw ServerException(
          message: 'Server error',
        );

      default:
        throw UnknownException(
          message: err.message ?? 'Unknown error',
        );
    }
  }
}