import 'package:injectable/injectable.dart';

import '../../features/auth/domain/usecases/get_profile_usecase.dart';
import '../../features/auth/domain/usecases/refresh_token_usecase.dart';
import '../../features/auth/presentation/cubit/auth_session_cubit.dart';
import '../storage/secure_storage/secure_storage_service.dart';

@lazySingleton
class SessionService {
  final SecureStorageService secureStorage;
  final GetProfileUseCase getProfileUseCase;
  final RefreshTokenUseCase refreshTokenUseCase;
  final AuthSessionCubit authSessionCubit;

  SessionService(
    this.secureStorage,
    this.getProfileUseCase,
    this.refreshTokenUseCase,
    this.authSessionCubit,
  );

  /// فقط وجود token رو چک میکنه — بدون API call
  /// برای AuthGuard استفاده میشه
  Future<bool> hasToken() async {
    final token = await secureStorage.getAccessToken();
    return token != null && token.isNotEmpty;
  }

  /// token رو refresh میکنه و در صورت موفقیت true برمیگردونه
  /// برای AuthGuard وقتی token نداره استفاده میشه
  Future<bool> tryRefresh() async {
    final refreshToken = await secureStorage.getRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) return false;

    final result = await refreshTokenUseCase(refreshToken);

    return result.fold(
      (_) => false,
      (_) => true,
    );
  }

  /// token وجود داره و profile هم valid هست
  /// فقط در Splash استفاده میشه
  Future<bool> isLoggedIn() async {
    final token = await secureStorage.getAccessToken();
    if (token == null || token.isEmpty) return false;

    final result = await getProfileUseCase();

    return result.fold(
      (_) => false,
      (user) {
        authSessionCubit.setUser(user);
        return true;
      },
    );
  }

  Future<void> logout() async {
    authSessionCubit.clear();
    await secureStorage.clear();
  }
}