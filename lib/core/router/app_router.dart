import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/ai_assistant/presentation/pages/ai_assistant_page.dart';
import '../../features/main/presentation/pages/main_shell_page.dart';
import 'guards/auth_guard.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter({required this.authGuard});

  final AuthGuard authGuard;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),

    AutoRoute(page: LoginRoute.page),

    AutoRoute(
      page: MainShellRoute.page,
      guards: [authGuard],
      path: '/',
      children: [
        AutoRoute(page: HomeRoute.page, path: 'home', initial: true),
        AutoRoute(page: AiAssistantRoute.page, path: 'ai'),
      ],
    ),
  ];
}
