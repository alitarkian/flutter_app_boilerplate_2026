import 'package:injectable/injectable.dart';

import '../../features/auth/domain/usecases/get_profile_usecase.dart';
import '../../features/auth/presentation/cubit/auth_session_cubit.dart';
import '../storage/secure_storage/secure_storage_service.dart';

@lazySingleton
class SessionService {
  final SecureStorageService secureStorage;
  final GetProfileUseCase getProfileUseCase;
  final AuthSessionCubit authSessionCubit;

  SessionService(
    this.secureStorage,
    this.getProfileUseCase,
    this.authSessionCubit,
  );

  Future<bool> isLoggedIn() async {
    final token = await secureStorage.getAccessToken();

    if (token == null || token.isEmpty) {
      return false;
    }

    final result = await getProfileUseCase();

    return result.fold((failure) => false, (user) {
      authSessionCubit.setUser(user);
      return true;
    });
  }

  Future<void> logout() async {
    authSessionCubit.clear();
    await secureStorage.clear();
  }
}
