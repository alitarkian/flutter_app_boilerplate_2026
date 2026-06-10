import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/auth_me_model.dart';
import '../repositories/auth_repository.dart';

@injectable
class GetProfileUseCase {
  final AuthRepository repository;

  GetProfileUseCase(this.repository);

  Future<Either<Failure, AuthMeModel>> call() {
    return repository.getProfile();
  }
}
