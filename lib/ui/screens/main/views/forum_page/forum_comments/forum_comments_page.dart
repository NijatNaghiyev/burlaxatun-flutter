import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../cubits/forum_comments/forum_comments_cubit.dart';
import '../../../../../widgets/custom_refresh_indicator.dart';
import '../../../../../widgets/global_appbar.dart';
import 'widgets/comment_input.dart';
import 'widgets/forum_comments_custom_scroll.dart';

class ForumCommentsPage extends StatelessWidget {
  final int forumId;

  const ForumCommentsPage({
    super.key,
    required this.forumId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Forum Comments',
        onLeadingTap: () {
          context.pop();
        },
      ),
      body: CustomRefreshIndicator(
        onRefresh: () async {
          context.read<ForumCommentsCubit>().getForumComments();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: BlocBuilder<ForumCommentsCubit, ForumCommentsState>(
            builder: (context, state) {
              if (state.status == ForumCommentsStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status == ForumCommentsStatus.success) {
                final comments = state.response?.results
                        ?.where((comment) => comment.forum == forumId)
                        .toList() ??
                    [];

                return ForumCommentsCustomScroll(
                  forumId: forumId,
                  comments: comments,
                );
              } else if (state.status == ForumCommentsStatus.failure) {
                return Center(child: Text("Error loading comments"));
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
      bottomSheet: CommentInput(),
    );
  }
}
