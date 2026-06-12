import 'package:flutter/material.dart';

import 'app_loader.dart';

class AppFullscreenLoader extends StatelessWidget {
  const AppFullscreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: AppLoader.large()));
  }
}
