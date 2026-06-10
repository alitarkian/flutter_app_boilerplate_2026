abstract final class ApiEndpoints {
  const ApiEndpoints._();

  static const health = '/health';

  static const login = '/auth/login';

  static const profile = '/auth/me';

  static const refreshToken = '/auth/refresh';

  static const logout = '/auth/logout';
}
