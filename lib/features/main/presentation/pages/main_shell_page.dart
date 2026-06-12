import 'package:app_boilerplate/core/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainShellPage extends StatelessWidget {
  const MainShellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [HomeRoute(), AiAssistantRoute()],
      bottomNavigationBuilder: (context, tabsRouter) {
        return NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: tabsRouter.setActiveIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.smart_toy_outlined),
              label: 'AI',
            ),
          ],
        );
      },
    );
  }
}
