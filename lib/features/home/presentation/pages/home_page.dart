import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../auth/data/models/auth_me_model.dart';
import '../../../auth/presentation/cubit/auth_session_cubit.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthSessionCubit>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: BlocBuilder<AuthSessionCubit, AuthMeModel?>(
          builder: (context, user) {
            if (user == null) {
              return const Center(child: CircularProgressIndicator());
            }
            // TODO : show more user info
            return Center(child: Text('Welcome ${user.userId}'));
          },
        ),
      ),
    );
  }
}
