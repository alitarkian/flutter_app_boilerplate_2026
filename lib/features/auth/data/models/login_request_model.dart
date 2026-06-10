class LoginRequestModel {
  final String email;
  final String password;
  final String tenantSlug;
  final String deviceId;

  const LoginRequestModel({
    required this.email,
    required this.password,
    required this.tenantSlug,
    required this.deviceId,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'tenant_slug': tenantSlug,
      'device_id': deviceId,
    };
  }
}
