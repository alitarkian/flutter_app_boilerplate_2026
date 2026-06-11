import 'package:flutter/material.dart';

import '../core/config/env.dart';
import '../core/di/injection.dart';
import '../core/router/app_router.dart';
import '../core/theme/app_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _router = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: Env.config.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routerConfig: _router.config(),
    );
  }
}