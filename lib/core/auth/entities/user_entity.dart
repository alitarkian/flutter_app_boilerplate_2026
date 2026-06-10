import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;

  final String email;

  final String tenantId;

  final String tenantSlug;

  final List<String> roles;

  const UserEntity({
    required this.id,
    required this.email,
    required this.tenantId,
    required this.tenantSlug,
    required this.roles,
  });

  @override
  List<Object?> get props => [id, email, tenantId, tenantSlug, roles];
}
