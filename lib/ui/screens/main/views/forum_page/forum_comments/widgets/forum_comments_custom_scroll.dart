import 'package:burla_xatun/data/models/remote/response/forum_comments_model.dart';
import 'package:flutter/material.dart';

import 'comments_box.dart';

class ForumCommentsCustomScroll extends StatelessWidget {
  final int forumId;
  final List<Result> comments;

  const ForumCommentsCustomScroll({
    super.key,
    required this.forumId,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: comments.isEmpty
          ? [
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Text(
                    'No elements',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            ]
          : [
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 105),
                sliver: CommentsBox(
                  forumId: forumId,
                  comments: comments,
                ),
              ),
            ],
    );
  }
}
