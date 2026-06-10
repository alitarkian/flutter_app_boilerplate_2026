import 'package:dartz/dartz.dart';

import '../../../../core/auth/entities/session_entity.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/auth_me_model.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, SessionEntity>> login({
    required String email,
    required String password,
    required String tenantSlug,
    required String deviceId,
  });

  Future<Either<Failure, AuthMeModel>> getProfile();

  Future<Either<Failure, Unit>> logout();
}
