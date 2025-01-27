import 'package:flutter/material.dart';

import 'add_new_forum_button.dart';
import 'forum_title.dart';
import '../../widgets/forum_box.dart';
import 'secondary_forum_search_input.dart';

class SecondaryForumPageCustomScroll extends StatelessWidget {
  const SecondaryForumPageCustomScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(top: 22, bottom: 18),
              sliver: SliverToBoxAdapter(
                child: ForumTitle(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 18),
              sliver: SliverToBoxAdapter(
                child: SecondaryForumSearchInput(),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 7,
                (_, i) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: ForumBox(),
                  );
                },
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 24,
          child: AddNewForumButton(),
        ),
      ],
    );
  }
}
