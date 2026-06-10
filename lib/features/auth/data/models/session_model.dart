import '../../../../core/auth/entities/session_entity.dart';
import 'token_model.dart';
import 'user_model.dart';

class SessionModel extends SessionEntity {
  const SessionModel({required super.token, required super.user});

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
      token: TokenModel.fromJson(json['token']),
      user: UserModel.fromJson(json['user']),
    );
  }
}
