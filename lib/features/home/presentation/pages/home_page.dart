import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/ui/widgets/app_error_widget.dart';
import '../../../../core/ui/widgets/app_loader.dart';

import '../bloc/home_cubit.dart';
import '../bloc/home_state.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (_) => getIt<HomeCubit>()..loadHome(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: AppLoader());
          }

          if (state is HomeError) {
            return Center(
              child: AppErrorWidget(
                message: state.message,
                onRetry: () {
                  context.read<HomeCubit>().loadHome();
                },
              ),
            );
          }

          if (state is HomeLoaded) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.data.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.data.subtitle,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
