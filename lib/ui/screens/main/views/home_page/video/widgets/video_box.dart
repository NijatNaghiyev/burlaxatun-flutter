import '../../widgets/article_box.dart';
import 'package:flutter/material.dart';

class VideoBox extends StatelessWidget {
  const VideoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ArticleBox(
      playButton: SizedBox(
        width: 44,
        height: 44,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.play_arrow_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
