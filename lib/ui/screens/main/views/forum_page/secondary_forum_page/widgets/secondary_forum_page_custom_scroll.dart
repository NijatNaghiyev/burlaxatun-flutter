import 'dart:developer';

import 'package:burla_xatun/cubits/forum_comments/forum_comments_cubit.dart';
import 'package:burla_xatun/cubits/forum_list/forum_list_cubit.dart';
import 'package:burla_xatun/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/forum_box.dart';
import 'add_new_forum_button.dart';
import 'forum_title.dart';
import 'secondary_forum_search_input.dart';

class SecondaryForumPageCustomScroll extends StatefulWidget {
  const SecondaryForumPageCustomScroll({super.key});

  @override
  State<SecondaryForumPageCustomScroll> createState() =>
      _SecondaryForumPageCustomScrollState();
}

class _SecondaryForumPageCustomScrollState
    extends State<SecondaryForumPageCustomScroll> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForumListCubit, ForumListState>(
      builder: (_, state) {
        if (state is ForumListLoading) {
          return const Center(child: CustomCircularProgressIndicator());
        }
        if (state is ForumListError) {
          log("Forum list ui error: ${state.message}");
          return const Text("Error");
        }
        if (state is ForumListNetworkError) {
          log("Forum list ui network error: ${state.message}");
          return const Text("Network Error");
        }
        if (state is ForumListSuccess) {
          final allResults = state.forumListResponse.results ?? [];

          final filteredResults = allResults.where((forum) {
            final fullName = forum.user?.fullName?.toLowerCase() ?? '';
            final text = forum.text?.toLowerCase() ?? '';
            return fullName.contains(searchText.toLowerCase()) ||
                text.contains(searchText.toLowerCase());
          }).toList();

          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              RefreshIndicator(
                onRefresh: () async {
                  final categoryId = allResults.first.category?.id;
                  if (categoryId != null) {
                    await context
                        .read<ForumListCubit>()
                        .getForumList(categoryId: categoryId.toString());
                  }
                },
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 22, bottom: 18),
                      sliver: SliverToBoxAdapter(
                        child: ForumTitle(
                          title: allResults.first.category?.name ?? '',
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.only(bottom: 18),
                      sliver: SliverToBoxAdapter(
                        child: SecondaryForumSearchInput(
                          onChanged: (value) {
                            setState(() {
                              searchText = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: filteredResults.length,
                        (_, i) {
                          final forum = filteredResults[i];
                          return BlocBuilder<ForumCommentsCubit,
                              ForumCommentsState>(
                            builder: (_, commentState) {
                              int commentCount = 0;
                              if (commentState.status ==
                                  ForumCommentsStatus.success) {
                                commentCount = commentState.response?.results
                                        ?.where((res) => res.forum == forum.id)
                                        .expand((res) => res.replies ?? [])
                                        .length ??
                                    0;
                              }
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 18),
                                child: ForumBox(
                                  authorName: forum.user?.fullName ?? "",
                                  forumTitle: forum.text ?? "",
                                  likeCount: forum.likes ?? 0,
                                  viewCount: forum.viewCount ?? 0,
                                  commentCount: commentCount,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 24,
                child: AddNewForumButton(
                  categoryId: allResults.first.category?.id ?? 0,
                ),
              ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
