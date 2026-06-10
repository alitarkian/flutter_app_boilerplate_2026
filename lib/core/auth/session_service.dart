import 'package:injectable/injectable.dart';

import '../storage/secure_storage/secure_storage_service.dart';

@lazySingleton
class SessionService {
  final SecureStorageService secureStorage;

  SessionService(this.secureStorage);

  Future<bool> isLoggedIn() async {
    final token = await secureStorage.getAccessToken();

    return token != null && token.isNotEmpty;
  }

  Future<void> logout() async {
    await secureStorage.clear();
  }
}
