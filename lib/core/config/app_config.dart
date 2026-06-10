import 'environment.dart';

class AppConfig {
  final EnvironmentType environment;

  final String appName;

  final String baseUrl;

  final bool enableLogs;

  final bool enableInspector;

  const AppConfig({
    required this.environment,
    required this.appName,
    required this.baseUrl,
    required this.enableLogs,
    required this.enableInspector,
  });

  bool get isDev => environment == EnvironmentType.dev;

  bool get isStaging => environment == EnvironmentType.staging;

  bool get isProd => environment == EnvironmentType.prod;
}
