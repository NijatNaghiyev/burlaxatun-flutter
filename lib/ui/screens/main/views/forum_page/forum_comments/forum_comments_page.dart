import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../widgets/global_appbar.dart';
import 'widgets/comment_input.dart';
import 'widgets/forum_comments_custom_scroll.dart';

class ForumCommentsPage extends StatelessWidget {
  const ForumCommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Forum',
        onTap: () {
          context.pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ForumCommentsCustomScroll(),
      ),
      bottomSheet: CommentInput(),
    );
  }
}
