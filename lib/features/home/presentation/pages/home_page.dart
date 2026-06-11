import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/injection.dart';
import '../../../auth/domain/usecases/logout_usecase.dart';
import '../../../../core/router/app_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () async {
              final result = await getIt<LogoutUseCase>()();

              result.fold((_) {}, (_) {
                context.router.replaceAll([const LoginRoute()]);
              });
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(child: Text('Welcome To Home')),
    );
  }
}
