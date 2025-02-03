import 'package:burla_xatun/ui/screens/main/views/forum_page/forum_comments/widgets/comment_input.dart';
import 'package:burla_xatun/ui/screens/main/views/forum_page/forum_comments/widgets/forum_comments_custom_scroll.dart';
import 'package:burla_xatun/ui/widgets/global_appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
