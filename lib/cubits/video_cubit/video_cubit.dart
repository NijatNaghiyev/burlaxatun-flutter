import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import 'video_state.dart';

class VideoCubit extends Cubit<VideoInitial> {
  VideoCubit() : super(VideoInitial());

  late final VideoPlayerController videoController;
  late final ChewieController chewieController;

  Future<void> initializeVideoPlayer() async {
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

    emit(state.copyWith(isLoading: false));
    log('${state.isLoading}');
  }

  void playVideo() {
    chewieController.play();
  }

  @override
  Future<void> close() {
    videoController.dispose();
    chewieController.dispose();
    return super.close();
  }
}
