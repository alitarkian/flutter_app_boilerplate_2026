import 'package:app_boilerplate/core/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../../auth/session_service.dart';

@lazySingleton
class AuthGuard extends AutoRouteGuard {
  final SessionService sessionService;

  AuthGuard(this.sessionService);

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final isLoggedIn = await sessionService.isLoggedIn();

    if (isLoggedIn) {
      resolver.next(true);
    } else {
      router.replace(const LoginRoute());
    }
  }
}
