import 'package:injectable/injectable.dart';

import '../repositories/health_repository.dart';

@injectable
class CheckHealthUseCase {
  final HealthRepository repository;

  CheckHealthUseCase(this.repository);

  Future<bool> call() {
    return repository.checkHealth();
  }
}