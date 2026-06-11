import 'bootstrap.dart';
import 'core/config/app_config.dart';
import 'core/config/environment.dart';

Future<void> main() async {
  await bootstrap(
    AppConfig(
      environment: EnvironmentType.dev,
      appName: 'Boilerplate Dev',
      baseUrl: 'http://192.168.43.181:8000/api/v1',
      enableLogs: true,
      enableInspector: true,
    ),
  );
}
