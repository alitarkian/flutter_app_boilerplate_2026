import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLottie extends StatelessWidget {
  final String asset;

  final double? width;
  final double? height;

  final bool repeat;

  const AppLottie({
    super.key,
    required this.asset,
    this.width,
    this.height,
    this.repeat = true,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(asset, width: width, height: height, repeat: repeat);
  }
}
