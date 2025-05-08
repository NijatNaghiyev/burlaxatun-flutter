import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArticleDetailsAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final String imagePath;

  const ArticleDetailsAppbar({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 175,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.error),
                ),
              ),
            ),
            Positioned(
              top: 16,
              left: 15,
              child: GestureDetector(
                onTap: () => context.pop(),
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 175);
}
