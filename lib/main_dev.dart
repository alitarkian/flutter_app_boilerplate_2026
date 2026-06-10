import 'bootstrap.dart';
import 'core/config/app_config.dart';
import 'core/config/environment.dart';

Future<void> main() async {
  await bootstrap(
    AppConfig(
      environment: EnvironmentType.dev,
      appName: 'Boilerplate Dev',
      baseUrl: 'https://dev-api.example.com',
      enableLogs: true,
      enableInspector: true,
    ),
  );
}