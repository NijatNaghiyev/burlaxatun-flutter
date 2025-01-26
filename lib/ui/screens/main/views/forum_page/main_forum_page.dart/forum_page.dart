import 'package:burla_xatun/ui/screens/main/views/forum_page/main_forum_page.dart/widgets/main_forum_custom_scroll.dart';
import 'package:burla_xatun/ui/widgets/global_appbar.dart';
import 'package:flutter/material.dart';

class MainForumPage extends StatelessWidget {
  const MainForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Əsas forum',
        onTap: () {},
      ),
      body: MainForumCustomScroll(),
    );
  }
}
