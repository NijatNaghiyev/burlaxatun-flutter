import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AdviseImage extends StatelessWidget {
  final String imageUrl;

  const AdviseImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 148,
        errorWidget: (context, url, error) =>
            const Icon(Icons.broken_image, size: 100),
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
