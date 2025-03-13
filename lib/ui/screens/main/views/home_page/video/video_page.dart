import 'package:burla_xatun/cubits/video_cubit/video_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../widgets/global_appbar.dart';
import 'widgets/video_list.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoCubit()..initializeVideoPlayer(),
      child: Scaffold(
        appBar: GlobalAppbar(
          title: 'Video',
          onTap: () {
            context.pop();
          },
        ),
        body: Column(
          children: [
            VideoList(),
          ],
        ),
      ),
    );
  }
}
