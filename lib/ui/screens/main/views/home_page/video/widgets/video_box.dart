import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../../widgets/article_box.dart';
import 'play_button.dart';

class VideoBox extends StatefulWidget {
  const VideoBox({super.key});

  @override
  State<VideoBox> createState() => _VideoBoxState();
}

class _VideoBoxState extends State<VideoBox> {
  late final VideoPlayerController videoController;
  late final ChewieController chewieController;
  bool isLoading = true;
  bool isPlaying = false;

  @override
  initState() {
    initializeVideoPlayer();
    super.initState();
  }

  void initializeVideoPlayer() async {
    final url = Uri.parse(
        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4');

    videoController = VideoPlayerController.networkUrl(url);

    await videoController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoController,
      autoPlay: false,
      looping: false,
      showControls: true,
      allowFullScreen: true,
      fullScreenByDefault: true,
      showControlsOnInitialize: false,
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.portraitUp,
      ],
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
      ],
    );

    isLoading = false;
    setState(() {});
  }

  void playVideo() {
    chewieController.play();
    isPlaying = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final videoCubit = context.read<VideoCubit>();
    return ArticleBox(
      videoOrImage: isLoading
          ? CircularProgressIndicator.adaptive()
          : Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: AspectRatio(
                      aspectRatio: 16 / 9.1,
                      child: Chewie(controller: chewieController),
                    ),
                  ),
                ),
                isPlaying
                    ? SizedBox.shrink()
                    : PlayButton(
                        onTap: () {
                          playVideo();
                        },
                      ),
              ],
            ),
      boxTitle: 'Doğuşdan Sonra Emosional və Fiziki Dəyişikliklər',
      boxDescription:
          'Pregnancy Yoga helps alleviate the effect of common symptoms such as morning sickness, painful leg cramps, swollen ankles, and constipation.',
    );
  }
}
