import 'bootstrap.dart';
import 'core/config/app_config.dart';
import 'core/config/environment.dart';

Future<void> main() async {
  await bootstrap(
    AppConfig(
      environment: EnvironmentType.prod,
      appName: 'Boilerplate',
      baseUrl: 'https://api.example.com',
      enableLogs: false,
      enableInspector: false,
    ),
  );
}