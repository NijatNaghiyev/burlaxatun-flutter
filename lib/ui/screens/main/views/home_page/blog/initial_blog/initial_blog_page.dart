import 'package:burla_xatun/cubits/blog_sliders/blog_sliders_cubit.dart';
import 'package:burla_xatun/ui/screens/main/views/home_page/blog/article_details/all_articles.dart';
import 'package:burla_xatun/ui/screens/main/views/home_page/blog/initial_blog/widgets/blog_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_appbar.dart';
import 'widgets/search_input.dart';

class InitialBlogPage extends StatelessWidget {
  const InitialBlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final mainCubit = context.read<MainnCubit>();
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Blog',
        onLeadingTap: () {
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
            BlocBuilder<BlogSlidersCubit, BlogSlidersState>(
              builder: (context, state) {
                return BlogBanner();
              },
            ),
            24.h,
            // ArticlesWidget(),
            // 24.h,
            // ArticlesWidget(),

            AllArticles(),
          ],
        ),
      ),
    );
  }
}
