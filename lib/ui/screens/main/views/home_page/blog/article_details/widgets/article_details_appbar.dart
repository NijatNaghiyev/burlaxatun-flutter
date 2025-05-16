import 'package:burla_xatun/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:burla_xatun/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class ArticleDetailsAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final String imagePath;
  final bool isVideo;
  final bool isPlaying;
  final VideoPlayerController? videoController;
  final VoidCallback? onPlayPause;

  const ArticleDetailsAppbar({
    super.key,
    required this.imagePath,
    this.isVideo = false,
    this.isPlaying = false,
    this.videoController,
    this.onPlayPause,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 182,
      child: Stack(
        children: [
          Positioned.fill(
            child: isVideo &&
                    videoController != null &&
                    videoController!.value.isInitialized
                ? GestureDetector(
                    onTap: onPlayPause,
                    child: AspectRatio(
                      aspectRatio: videoController!.value.aspectRatio,
                      child: VideoPlayer(videoController!),
                    ),
                  )
                : Image.network(imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        CustomCircularProgressIndicator()),
          ),
          if (isVideo && !isPlaying)
            Positioned.fill(
              child: Center(
                child: GestureDetector(
                  onTap: onPlayPause,
                  child: Icon(
                    Icons.play_circle_outline,
                    size: 40,
                    color: ColorConstants.primaryRedColor,
                  ),
                ),
              ),
            ),
          Positioned(
            top: 26,
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
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 182);
}
