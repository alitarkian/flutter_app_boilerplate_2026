import 'app_config.dart';

class Env {
  static late AppConfig config;

  static void init(AppConfig appConfig) {
    config = appConfig;
  }
}