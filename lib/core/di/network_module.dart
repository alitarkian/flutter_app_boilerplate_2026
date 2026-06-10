import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../network/dio_client.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(
    DioClient client,
  ) =>
      client.dio;
}