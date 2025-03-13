import 'package:flutter/material.dart';

import 'video_box.dart';

class VideoList extends StatelessWidget {
  const VideoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (_, i) {
          return VideoBox();
        }, 
      ),
    );
  }
}
