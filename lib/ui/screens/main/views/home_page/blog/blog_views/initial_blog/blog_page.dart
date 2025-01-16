import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../cubits/main/mainn_cubit.dart';
import '../../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../../widgets/global_appbar.dart';
import 'widgets/articles_widget.dart';
import 'widgets/carousel_widget.dart';
import 'widgets/search_input.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Blog',
        onTap: () {
          mainCubit.changeHomeView('Home');
          mainCubit.scrollLatestPositionHomePage();
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
            CarouselWidget(),
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
