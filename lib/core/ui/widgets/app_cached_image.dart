import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'app_loader.dart';

class AppCachedImage extends StatelessWidget {
  final String imageUrl;

  final double? width;
  final double? height;

  final BoxFit fit;

  final BorderRadius? borderRadius;

  const AppCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    Widget image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => const Center(child: AppLoader.small()),
      errorWidget: (context, url, error) =>
          const Center(child: Icon(Icons.broken_image)),
    );

    if (borderRadius != null) {
      image = ClipRRect(borderRadius: borderRadius!, child: image);
    }

    return image;
  }
}
