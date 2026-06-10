import 'package:equatable/equatable.dart';

class AuthMeEntity extends Equatable {
  final String userId;

  final String tenantId;

  final List<String> roles;

  final List<String> permissions;

  const AuthMeEntity({
    required this.userId,
    required this.tenantId,
    required this.roles,
    required this.permissions,
  });

  @override
  List<Object?> get props => [userId, tenantId, roles, permissions];
}
