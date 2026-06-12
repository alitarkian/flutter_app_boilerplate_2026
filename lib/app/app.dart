import 'package:app_boilerplate/core/ui/widgets/responsive/screen_util_init.dart';
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
    return AppScreenUtilInit(
      child: MaterialApp.router(
        title: Env.config.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: ThemeMode.system,
        routerConfig: _router.config(),
      ),
    );
  }
}
