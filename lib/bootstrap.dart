import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/config/app_config.dart';
import 'core/config/env.dart';
import 'core/di/injection.dart';

Future<void> bootstrap(AppConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();

  Env.init(config);

  await configureDependencies(config);

  runApp(const App());
}
