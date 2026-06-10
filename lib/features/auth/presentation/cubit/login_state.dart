import 'package:equatable/equatable.dart';

import '../../../../core/auth/entities/session_entity.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  final LoginStatus status;

  final SessionEntity? session;

  final String? errorMessage;

  const LoginState({
    this.status = LoginStatus.initial,
    this.session,
    this.errorMessage,
  });

  LoginState copyWith({
    LoginStatus? status,
    SessionEntity? session,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      session: session ?? this.session,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, session, errorMessage];
}
