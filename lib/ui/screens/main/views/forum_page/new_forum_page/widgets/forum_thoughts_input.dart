import 'package:flutter/material.dart';

import 'forum_input.dart';

class ForumThoughtsInput extends StatelessWidget {
  const ForumThoughtsInput({super.key});

  @override
  Widget build(BuildContext context) {
    return ForumInput(
      hintText: 'Fikirlərinizi buraya yaza bilərsiniz',
      topPadding: 26,
      maxLines: 15,
    );
  }
}
