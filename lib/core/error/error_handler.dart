import 'exceptions.dart';
import 'failures.dart';

class ErrorHandler {
  static Failure handle(
    Exception exception,
  ) {
    switch (exception) {
      case UnauthorizedException():
        return UnauthorizedFailure(
          message: exception.message,
        );

      case ForbiddenException():
        return ForbiddenFailure(
          message: exception.message,
        );

      case NotFoundException():
        return NotFoundFailure(
          message: exception.message,
        );

      case ValidationException():
        return ValidationFailure(
          message: exception.message,
        );

      case CacheException():
        return CacheFailure(
          message: exception.message,
        );

      case NetworkException():
        return NetworkFailure(
          message: exception.message,
        );

      case TimeoutException():
        return TimeoutFailure(
          message: exception.message,
        );

      case ServerException():
        return ServerFailure(
          message: exception.message,
        );

      default:
        return UnknownFailure(
          message: exception.toString(),
        );
    }
  }
}