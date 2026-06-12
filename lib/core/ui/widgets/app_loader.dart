import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  final double size;

  const AppLoader({super.key, this.size = 32});

  const AppLoader.small({super.key}) : size = 20;

  const AppLoader.medium({super.key}) : size = 32;

  const AppLoader.large({super.key}) : size = 48;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: const CircularProgressIndicator(),
    );
  }
}
