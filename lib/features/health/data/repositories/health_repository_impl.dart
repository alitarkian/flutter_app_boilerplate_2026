import 'package:injectable/injectable.dart';

import '../../domain/repositories/health_repository.dart';
import '../datasources/health_remote_data_source.dart';

@LazySingleton(as: HealthRepository)
class HealthRepositoryImpl implements HealthRepository {
  final HealthRemoteDataSource remoteDataSource;

  HealthRepositoryImpl(this.remoteDataSource);

  @override
  Future<bool> checkHealth() {
    return remoteDataSource.checkHealth();
  }
}
