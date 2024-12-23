import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../widgets/global_appbar.dart';
import 'widgets/video_box.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final mainCubit = context.read<MainnCubit>();
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Video',
        onTap: () {
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                22.h,
                VideoBox(),
                24.h,
                VideoBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
