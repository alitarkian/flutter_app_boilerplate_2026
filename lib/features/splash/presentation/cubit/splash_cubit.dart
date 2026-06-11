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
      final isHealthy = await checkHealthUseCase();

      if (!isHealthy) {
        emit(state.copyWith(status: SplashStatus.serverUnavailable));
        return;
      }

      final isLoggedIn = await sessionService.isLoggedIn();

      emit(
        state.copyWith(
          status: isLoggedIn
              ? SplashStatus.authenticated
              : SplashStatus.unauthenticated,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: SplashStatus.serverUnavailable));
    }
  }
}
