import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_appbar.dart';
import 'widgets/articles_widget.dart';
import '../../../../../../widgets/global_banner.dart';
import 'widgets/search_input.dart';

class InitialBlogPage extends StatelessWidget {
  const InitialBlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final mainCubit = context.read<MainnCubit>();
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Blog',
        onTap: () {
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SearchInput(),
            ),
            24.h,
            GlobalBanner(),
            24.h,
            ArticlesWidget(),
            24.h,
            ArticlesWidget(),
          ],
        ),
      ),
    );
  }
}
