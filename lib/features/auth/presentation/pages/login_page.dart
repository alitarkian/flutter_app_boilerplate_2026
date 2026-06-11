import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/di/injection.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController tenantController;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
    tenantController = TextEditingController();

    // فقط برای تست اولیه
    emailController.text = '';
    passwordController.text = '';
    tenantController.text = '';
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    tenantController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status == LoginStatus.success) {
              context.router.replace(HomeRoute());
            }

            if (state.status == LoginStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage ?? 'Login Failed')),
              );
            }
          },
          builder: (context, state) {
            final isLoading = state.status == LoginStatus.loading;

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(height: 32),

                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),

                    const SizedBox(height: 16),

                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Password'),
                    ),

                    const SizedBox(height: 16),

                    TextField(
                      controller: tenantController,
                      decoration: const InputDecoration(
                        labelText: 'Tenant Slug',
                      ),
                    ),

                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () {
                                context.read<LoginCubit>().login(
                                  email: emailController.text.trim(),
                                  password: passwordController.text,
                                  tenantSlug: tenantController.text.trim(),
                                  deviceId: 'android-test-device',
                                );
                              },
                        child: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(),
                              )
                            : const Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
