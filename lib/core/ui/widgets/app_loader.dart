import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  final double size;

  final double strokeWidth;

  const AppLoader({super.key, this.size = 32, this.strokeWidth = 3});

  const AppLoader.small({super.key}) : size = 20, strokeWidth = 2;

  const AppLoader.medium({super.key}) : size = 32, strokeWidth = 3;

  const AppLoader.large({super.key}) : size = 48, strokeWidth = 4;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(strokeWidth: strokeWidth),
    );
  }
}
