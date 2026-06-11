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
    // اگه token داره — بذار بره (سریع، بدون API)
    final hasToken = await sessionService.hasToken();
    if (hasToken) {
      resolver.next(true);
      return;
    }

    // token نداره — سعی کن refresh کنی
    final refreshed = await sessionService.tryRefresh();
    if (refreshed) {
      resolver.next(true);
      return;
    }

    // refresh هم نشد — session رو پاک کن و بفرست Login
    await sessionService.logout();
    router.replace(const LoginRoute());
  }
}