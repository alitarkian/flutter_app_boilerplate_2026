import 'package:app_boilerplate/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:app_boilerplate/features/auth/data/models/auth_me_model.dart';
import 'package:app_boilerplate/features/auth/data/models/login_request_model.dart';
import 'package:app_boilerplate/features/auth/data/models/session_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/storage/secure_storage/secure_storage_service.dart';
import '../../domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  final SecureStorageService secureStorage;

  AuthRepositoryImpl(this.remoteDataSource, this.secureStorage);

  @override
  Future<Either<Failure, SessionModel>> login({
    required String email,
    required String password,
    required String tenantSlug,
    required String deviceId,
  }) async {
    try {
      final result = await remoteDataSource.login(
        LoginRequestModel(
          email: email,
          password: password,
          tenantSlug: tenantSlug,
          deviceId: deviceId,
        ),
      );

      await secureStorage.saveAccessToken(result.token.accessToken);
      await secureStorage.saveUserId(result.user.id);
      await secureStorage.saveTenantId(result.user.tenantId);
      await secureStorage.saveTenantSlug(result.user.tenantSlug);

      return Right(result);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, AuthMeModel>> getProfile() async {
    try {
      final result = await remoteDataSource.getProfile();

      return Right(result);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await secureStorage.clear();

      return const Right(unit);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
