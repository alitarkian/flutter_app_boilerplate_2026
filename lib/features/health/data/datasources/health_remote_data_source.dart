import 'package:injectable/injectable.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';

abstract interface class HealthRemoteDataSource {
  Future<bool> checkHealth();
}

@LazySingleton(as: HealthRemoteDataSource)
class HealthRemoteDataSourceImpl implements HealthRemoteDataSource {
  final DioClient dioClient;

  HealthRemoteDataSourceImpl(this.dioClient);

  @override
  Future<bool> checkHealth() async {
    try {
      final response = await dioClient.dio.get(ApiEndpoints.health);

      print('HEALTH STATUS => ${response.statusCode}');
      print('HEALTH DATA => ${response.data}');
      print('HEALTH TYPE => ${response.runtimeType}');

      return response.statusCode == 200;
    } catch (e, s) {
      print('HEALTH ERROR => $e');
      print(s);
      return false;
    }
  }
}
