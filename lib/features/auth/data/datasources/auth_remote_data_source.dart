import 'package:injectable/injectable.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../models/auth_me_model.dart';
import '../models/login_request_model.dart';
import '../models/session_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<SessionModel> login(LoginRequestModel request);

  Future<SessionModel> refreshToken(String refreshToken);

  Future<AuthMeModel> getProfile();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSourceImpl(this.dioClient);

  @override
  Future<SessionModel> login(LoginRequestModel request) async {
    final response = await dioClient.dio.post(
      ApiEndpoints.login,
      data: request.toJson(),
    );

    return SessionModel.fromJson(response.data);
  }

  @override
  Future<SessionModel> refreshToken(String refreshToken) async {
    final response = await dioClient.dio.post(
      ApiEndpoints.refreshToken,
      data: {'refresh_token': refreshToken},
    );

    return SessionModel.fromJson(response.data);
  }

  @override
  Future<AuthMeModel> getProfile() async {
    final response = await dioClient.dio.get(ApiEndpoints.profile);

    return AuthMeModel.fromJson(response.data);
  }
}
