import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/login_usecase.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(const LoginState());

  Future<void> login({
    required String email,
    required String password,
    required String tenantSlug,
    required String deviceId,
  }) async {
    emit(state.copyWith(status: LoginStatus.loading));

    final result = await loginUseCase(
      LoginParams(
        email: email,
        password: password,
        tenantSlug: tenantSlug,
        deviceId: deviceId,
      ),
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: LoginStatus.failure,
            errorMessage: failure.message,
          ),
        );
      },
      (session) {
        emit(state.copyWith(status: LoginStatus.success, session: session));
      },
    );
  }
}
