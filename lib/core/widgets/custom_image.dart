import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final double height;
  final double width;
  final String? imageUrl;
  final BoxFit? fit;
  final Color? color;
  final Color? imageColor;
  final double radius;
  final bool? isLoading;
  final double? opacity;

  const CustomNetworkImage({
    super.key,
    this.height = 50,
    this.width = 50,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.color = Colors.white,
    this.imageColor,
    this.radius = 10.0,
    this.opacity,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      clipBehavior: Clip.antiAlias,
      child: isLoading ?? false
          ? const Center(child: CircularProgressIndicator.adaptive())
          : imageUrl != null && imageUrl != ''
              ? Image.network(
                  imageUrl ?? '',
                  fit: fit,
                  opacity: AlwaysStoppedAnimation(opacity ?? 1),
                  color: imageColor,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator.adaptive(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                )
              : const Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.black,
                  ),
                ),
    );
  }
}

class CustomAssetImage extends StatelessWidget {
  final double height;
  final double width;
  final String? imageLocation;
  final BoxFit? fit;
  final Color color;
  final double radius;

  const CustomAssetImage({
    super.key,
    this.height = 50,
    this.width = 50,
    required this.imageLocation,
    this.fit = BoxFit.fill,
    this.color = Colors.white,
    this.radius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      clipBehavior: Clip.antiAlias,
      child: imageLocation != null && imageLocation != ''
          ? Image.asset(
              imageLocation ?? '',
              fit: fit,
              height: height,
              width: width,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.error,
                color: Colors.black,
              ),
            )
          : const Center(
              child: Icon(
                Icons.error,
                color: Colors.black,
              ),
            ),
    );
  }
}
