import 'package:app_boilerplate/core/usecases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/home_entity.dart';
import '../repositories/home_repository.dart';

@injectable
class GetHomeDataUseCase implements UseCase<HomeEntity, NoParams> {
  final HomeRepository repository;

  GetHomeDataUseCase(this.repository);

  @override
  Future<Either<Failure, HomeEntity>> call(NoParams params) {
    return repository.getHomeData();
  }
}
