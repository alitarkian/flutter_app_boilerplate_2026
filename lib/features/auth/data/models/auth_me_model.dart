import '../../../../core/auth/entities/auth_me_entity.dart';

class AuthMeModel extends AuthMeEntity {
  const AuthMeModel({
    required super.userId,
    required super.tenantId,
    required super.roles,
    required super.permissions,
  });

  factory AuthMeModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return AuthMeModel(
      userId: data['user_id'] ?? '',
      tenantId: data['tenant_id'] ?? '',
      roles: List<String>.from(data['roles'] ?? []),
      permissions: List<String>.from(data['permissions'] ?? []),
    );
  }
}
