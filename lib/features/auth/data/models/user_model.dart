import '../../../../core/auth/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.tenantId,
    required super.tenantSlug,
    required super.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      tenantId: json['tenant_id'] ?? '',
      tenantSlug: json['tenant_slug'] ?? '',
      roles: List<String>.from(json['roles'] ?? []),
    );
  }
}
