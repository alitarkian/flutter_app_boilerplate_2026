import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../models/home_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeModel> getHomeData();
}

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;

  HomeRemoteDataSourceImpl(this.dio);

  @override
  Future<HomeModel> getHomeData() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return const HomeModel(title: 'Home', subtitle: 'Welcome to Boilerplate');

    // API Example:

    // final response = await dio.get('/home');
    //
    // return HomeModel.fromJson(
    //   response.data,
    // );
  }
}
