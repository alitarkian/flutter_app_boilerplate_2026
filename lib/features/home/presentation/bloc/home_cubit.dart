import 'package:app_boilerplate/core/usecases/use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_home_data_usecase.dart';

import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetHomeDataUseCase getHomeDataUseCase;

  HomeCubit(this.getHomeDataUseCase) : super(const HomeInitial());

  Future<void> loadHome() async {
    emit(const HomeLoading());

    final result = await getHomeDataUseCase(NoParams());

    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (data) => emit(HomeLoaded(data)),
    );
  }
}
