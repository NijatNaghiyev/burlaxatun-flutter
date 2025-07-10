import 'dart:developer';

import 'package:burla_xatun/cubits/forum_category/forum_category_cubit.dart';
import 'package:burla_xatun/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'main_forum_banner.dart';
import 'main_forum_title_box.dart';

class MainForumCustomScroll extends StatelessWidget {
  const MainForumCustomScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForumCategoryCubit, ForumCategoryState>(
      builder: (_, state) {
        if (state is ForumCategoryLoading) {
          return Center(
            child: CustomCircularProgressIndicator(),
          );
        }
        if (state is ForumCategoryError) {
          log("Forum Category UI error: ${state.message}");
          return Center(child: Text("Xəta"));
        }
        if (state is ForumCategoryNetworkError) {
          log("Forum Category UI network error: ${state.message}");
          return Center(child: Text("Şəbəkə xətası"));
        }
        if (state is ForumCategorySuccess) {
          final data = state.response;
          return RefreshIndicator(
            onRefresh: () async {
              await context.read<ForumCategoryCubit>().getForumCategory();
            },
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.only(bottom: 24),
                  sliver: SliverToBoxAdapter(
                    child: MainForumBanner(),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: data.length,
                    (_, i) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 24) +
                            EdgeInsets.symmetric(horizontal: 15),
                        child: MainForumTitleBox(
                          title: data[i].name ?? "",
                          topicCount: data[i].forumCount,
                          messageCount: data[i].totalViews ?? 0,
                          onTap: () => context.push(
                            '/secondary_forum?categoryId=${data[i].id}',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
