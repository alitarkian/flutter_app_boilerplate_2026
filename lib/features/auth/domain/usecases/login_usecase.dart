import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/auth/entities/session_entity.dart';
import '../../../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

class LoginParams {
  final String email;
  final String password;
  final String tenantSlug;
  final String deviceId;

  const LoginParams({
    required this.email,
    required this.password,
    required this.tenantSlug,
    required this.deviceId,
  });
}

@injectable
class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, SessionEntity>> call(LoginParams params) {
    return repository.login(
      email: params.email,
      password: params.password,
      tenantSlug: params.tenantSlug,
      deviceId: params.deviceId,
    );
  }
}
