import 'package:burla_xatun/ui/screens/main/views/forum_page/new_forum_page/widgets/forum_thoughts_input.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/new_forum_appbar.dart';

class CreateNewForum extends StatelessWidget {
  const CreateNewForum({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewForumAppbar(
        onTap: () {
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              22.h,
              // ForumTitleInput(),
              // 32.h,
              ForumThoughtsInput(),
            ],
          ),
        ),
      ),
    );
  }
}
