import 'package:app_boilerplate/features/health/domain/usecases/check_health_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/auth/session_service.dart';
import 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  final SessionService sessionService;
  final CheckHealthUseCase checkHealthUseCase;

  SplashCubit(this.sessionService, this.checkHealthUseCase)
    : super(const SplashState());

  Future<void> initialize() async {
    emit(state.copyWith(status: SplashStatus.loading));

    try {
      print('STEP 1');

      final isHealthy = await checkHealthUseCase();

      print('STEP 2: health=$isHealthy');

      if (!isHealthy) {
        emit(state.copyWith(status: SplashStatus.serverUnavailable));
        return;
      }

      print('STEP 3');

      final isLoggedIn = await sessionService.isLoggedIn();

      print('STEP 4: loggedIn=$isLoggedIn');

      emit(
        state.copyWith(
          status: isLoggedIn
              ? SplashStatus.authenticated
              : SplashStatus.unauthenticated,
        ),
      );

      print('STEP 5');
    } catch (e, s) {
      print('SPLASH ERROR => $e');
      print(s);

      emit(state.copyWith(status: SplashStatus.serverUnavailable));
    }
  }
}
