import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

import '../../domain/entities/home_entity.dart';
import '../../domain/repositories/home_repository.dart';

import '../datasources/home_remote_datasource.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, HomeEntity>> getHomeData() async {
    try {
      final result = await remoteDataSource.getHomeData();

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (_) {
      return const Left(UnknownFailure(message: ''));
    }
  }
}
