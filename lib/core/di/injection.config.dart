// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_boilerplate/core/auth/session_service.dart' as _i304;
import 'package:app_boilerplate/core/config/app_config.dart' as _i950;
import 'package:app_boilerplate/core/di/network_module.dart' as _i776;
import 'package:app_boilerplate/core/di/register_module.dart' as _i694;
import 'package:app_boilerplate/core/di/storage_module.dart' as _i390;
import 'package:app_boilerplate/core/network/dio_client.dart' as _i580;
import 'package:app_boilerplate/core/network/interceptors/auth_interceptor.dart'
    as _i506;
import 'package:app_boilerplate/core/network/interceptors/error_interceptor.dart'
    as _i461;
import 'package:app_boilerplate/core/network/interceptors/logging_interceptor.dart'
    as _i839;
import 'package:app_boilerplate/core/network/interceptors/retry_interceptor.dart'
    as _i586;
import 'package:app_boilerplate/core/network/network_info.dart' as _i229;
import 'package:app_boilerplate/core/network/websocket_client.dart' as _i567;
import 'package:app_boilerplate/core/storage/secure_storage/secure_storage_service.dart'
    as _i469;
import 'package:app_boilerplate/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i747;
import 'package:app_boilerplate/features/auth/domain/repositories/auth_repository.dart'
    as _i975;
import 'package:app_boilerplate/features/auth/domain/repositories/auth_repository_impl.dart'
    as _i0;
import 'package:app_boilerplate/features/auth/domain/usecases/get_profile_usecase.dart'
    as _i292;
import 'package:app_boilerplate/features/auth/domain/usecases/login_usecase.dart'
    as _i272;
import 'package:app_boilerplate/features/auth/domain/usecases/logout_usecase.dart'
    as _i523;
import 'package:app_boilerplate/features/auth/presentation/cubit/login_cubit.dart'
    as _i115;
import 'package:app_boilerplate/features/splash/presentation/cubit/splash_cubit.dart'
    as _i331;
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    final storageModule = _$StorageModule();
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => storageModule.secureStorage,
    );
    gh.lazySingleton<_i461.ErrorInterceptor>(() => _i461.ErrorInterceptor());
    gh.lazySingleton<_i586.RetryInterceptor>(() => _i586.RetryInterceptor());
    gh.lazySingleton<_i567.WebSocketClient>(() => _i567.WebSocketClient());
    gh.lazySingleton<_i469.SecureStorageService>(
      () => _i469.SecureStorageService(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i229.NetworkInfo>(
      () => _i229.NetworkInfoImpl(gh<_i895.Connectivity>()),
    );
    gh.lazySingleton<_i839.LoggingInterceptor>(
      () => _i839.LoggingInterceptor(gh<_i950.AppConfig>()),
    );
    gh.lazySingleton<_i304.SessionService>(
      () => _i304.SessionService(gh<_i469.SecureStorageService>()),
    );
    gh.lazySingleton<_i506.AuthInterceptor>(
      () => _i506.AuthInterceptor(gh<_i469.SecureStorageService>()),
    );
    gh.factory<_i331.SplashCubit>(
      () => _i331.SplashCubit(gh<_i304.SessionService>()),
    );
    gh.lazySingleton<_i580.DioClient>(
      () => _i580.DioClient(
        gh<_i950.AppConfig>(),
        gh<_i506.AuthInterceptor>(),
        gh<_i839.LoggingInterceptor>(),
        gh<_i586.RetryInterceptor>(),
        gh<_i461.ErrorInterceptor>(),
      ),
    );
    gh.lazySingleton<_i747.AuthRemoteDataSource>(
      () => _i747.AuthRemoteDataSourceImpl(gh<_i580.DioClient>()),
    );
    gh.lazySingleton<_i975.AuthRepository>(
      () => _i0.AuthRepositoryImpl(
        gh<_i747.AuthRemoteDataSource>(),
        gh<_i469.SecureStorageService>(),
      ),
    );
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio(gh<_i580.DioClient>()));
    gh.factory<_i292.GetProfileUseCase>(
      () => _i292.GetProfileUseCase(gh<_i975.AuthRepository>()),
    );
    gh.factory<_i272.LoginUseCase>(
      () => _i272.LoginUseCase(gh<_i975.AuthRepository>()),
    );
    gh.factory<_i523.LogoutUseCase>(
      () => _i523.LogoutUseCase(gh<_i975.AuthRepository>()),
    );
    gh.factory<_i115.LoginCubit>(
      () => _i115.LoginCubit(gh<_i272.LoginUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i694.RegisterModule {}

class _$StorageModule extends _i390.StorageModule {}

class _$NetworkModule extends _i776.NetworkModule {}
