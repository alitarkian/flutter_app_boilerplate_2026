import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService(this._storage);

  static const accessTokenKey = 'access_token';

  static const refreshTokenKey = 'refresh_token';

  static const userIdKey = 'user_id';

  static const tenantIdKey = 'tenant_id';

  static const tenantSlugKey = 'tenant_slug';

  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: accessTokenKey, value: token);
  }

  Future<String?> getAccessToken() async {
    return _storage.read(key: accessTokenKey);
  }

  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: refreshTokenKey, value: token);
  }

  Future<String?> getRefreshToken() async {
    return _storage.read(key: refreshTokenKey);
  }

  Future<void> saveUserId(String value) async {
    await _storage.write(key: userIdKey, value: value);
  }

  Future<void> saveTenantId(String value) async {
    await _storage.write(key: tenantIdKey, value: value);
  }

  Future<void> saveTenantSlug(String value) async {
    await _storage.write(key: tenantSlugKey, value: value);
  }

  Future<void> clear() async {
    await _storage.deleteAll();
  }
}
