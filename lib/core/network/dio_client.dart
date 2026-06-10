import 'package:app_boilerplate/core/network/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../config/app_config.dart';
import '../utils/constants.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import 'interceptors/retry_interceptor.dart';

@lazySingleton
class DioClient {
  final AppConfig config;

  final LoggingInterceptor loggingInterceptor;
  final RetryInterceptor retryInterceptor;
  final ErrorInterceptor errorInterceptor;
  final AuthInterceptor authInterceptor;

  late final Dio dio;

  DioClient(
    this.config,
    this.authInterceptor,
    this.loggingInterceptor,
    this.retryInterceptor,
    this.errorInterceptor,
  ) {
    dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl,

        connectTimeout: const Duration(
          milliseconds: AppConstants.connectTimeout,
        ),

        receiveTimeout: const Duration(
          milliseconds: AppConstants.receiveTimeout,
        ),

        sendTimeout: const Duration(milliseconds: AppConstants.sendTimeout),

        headers: const {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([
      authInterceptor,
      retryInterceptor,
      errorInterceptor,
      loggingInterceptor,
    ]);
  }
}
