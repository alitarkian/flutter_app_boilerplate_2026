import 'bootstrap.dart';
import 'core/config/app_config.dart';
import 'core/config/environment.dart';

Future<void> main() async {
  await bootstrap(
    AppConfig(
      environment: EnvironmentType.staging,
      appName: 'Boilerplate Staging',
      baseUrl: 'https://staging-api.example.com',
      enableLogs: true,
      enableInspector: false,
    ),
  );
}