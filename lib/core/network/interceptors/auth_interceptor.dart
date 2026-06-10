import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../storage/secure_storage/secure_storage_service.dart';
import '../api_endpoints.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  final SecureStorageService secureStorage;

  AuthInterceptor(
    this.secureStorage,
  );

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final path = options.path;

    final ignoredRoutes = [
      ApiEndpoints.login,
      ApiEndpoints.refreshToken,
      ApiEndpoints.health,
    ];

    if (ignoredRoutes.contains(path)) {
      return handler.next(options);
    }

    final token = await secureStorage.getAccessToken();

    if (token != null && token.isNotEmpty) {
      options.headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    handler.next(options);
  }
}