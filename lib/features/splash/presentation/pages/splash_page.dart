import 'package:app_boilerplate/core/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../cubit/splash_cubit.dart';
import '../cubit/splash_state.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SplashCubit>()..initialize(),
      child: const _SplashView(),
    );
  }
}

class _SplashView extends StatefulWidget {
  const _SplashView();

  @override
  State<_SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<_SplashView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        switch (state.status) {
          case SplashStatus.authenticated:
            if (state.status == SplashStatus.authenticated) {
              context.router.replace(const HomeRoute());
            }
            break;

          case SplashStatus.unauthenticated:
            if (state.status == SplashStatus.unauthenticated) {
              context.router.replace(const LoginRoute());
            }
            break;

          case SplashStatus.error:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Initialization failed')),
            );
            break;

          default:
            break;
        }
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
            ),
          ),
          child: SafeArea(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                children: [
                  const Spacer(),

                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.white.withValues(alpha: 0.08),
                      ),
                      child: const Icon(
                        Icons.apps_rounded,
                        color: Colors.white,
                        size: 64,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Tarkian Labs',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Enterprise Application Platform',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),

                  const Spacer(),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: Column(
                      children: [
                        const LinearProgressIndicator(),

                        const SizedBox(height: 16),

                        BlocBuilder<SplashCubit, SplashState>(
                          builder: (context, state) {
                            return Text(
                              _statusText(state.status),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 48),

                  const Text(
                    'v1.0.0',
                    style: TextStyle(color: Colors.white38, fontSize: 12),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _statusText(SplashStatus status) {
    switch (status) {
      case SplashStatus.initial:
        return 'Starting application...';

      case SplashStatus.loading:
        return 'Initializing services...';

      case SplashStatus.authenticated:
        return 'Loading workspace...';

      case SplashStatus.unauthenticated:
        return 'Redirecting to login...';

      case SplashStatus.error:
        return 'Something went wrong';

      case SplashStatus.maintenance:
        return 'Maintenance mode';

      case SplashStatus.updateRequired:
        return 'Update required';
    }
  }
}
