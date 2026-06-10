import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/network/dio_client.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    final client = getIt<DioClient>();

    debugPrint('BaseUrl => ${client.dio.options.baseUrl}');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Flutter Boilerplate')));
  }
}
