import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/auth/session_service.dart';
import 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  final SessionService sessionService;

  SplashCubit(this.sessionService) : super(const SplashState());

  Future<void> initialize() async {
    emit(state.copyWith(status: SplashStatus.loading));

    try {
      await Future.delayed(const Duration(seconds: 2));

      final isLoggedIn = await sessionService.isLoggedIn();

      emit(
        state.copyWith(
          status: isLoggedIn
              ? SplashStatus.authenticated
              : SplashStatus.unauthenticated,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: SplashStatus.error));
    }
  }
}
