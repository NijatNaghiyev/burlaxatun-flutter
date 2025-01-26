import 'package:burla_xatun/ui/screens/main/views/forum_page/main_forum_page.dart/widgets/main_forum_banner.dart';
import 'package:burla_xatun/ui/screens/main/views/forum_page/main_forum_page.dart/widgets/main_forum_title_box.dart';
import 'package:flutter/material.dart';

class MainForumCustomScroll extends StatelessWidget {
  const MainForumCustomScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(bottom: 24),
          sliver: SliverToBoxAdapter(
            child: MainForumBanner(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 3,
            (_, i) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 24) + EdgeInsets.symmetric(horizontal: 15),
                child: MainForumTitleBox(),
              );
            },
          ),
        ),
      ],
    );
  }
}
