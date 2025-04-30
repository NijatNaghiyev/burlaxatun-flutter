import 'package:burla_xatun/ui/screens/main/views/home_page/widgets/article_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_appbar.dart';
import '../../widgets/article_box.dart';

class SeeAllArticlesPage extends StatelessWidget {
  const SeeAllArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Doğuştan sonra Bərpa',
        onLeadingTap: () {
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                22.h,
                ArticleBox(
                  onTap: () => context.push('/article_details'),
                  videoOrImage: ArticleImage(),
                  boxTitle: 'Doğuşdan Sonra Emosional və Fiziki Dəyişikliklər',
                  boxDescription:
                      'Pregnancy Yoga helps alleviate the effect of common symptoms such as morning sickness, painful leg cramps, swollen ankles, and constipation.',
                ),
                24.h,
                ArticleBox(
                  onTap: () => context.push('/article_details'),
                  videoOrImage: ArticleImage(),
                  boxTitle: 'Doğuşdan Sonra Emosional və Fiziki Dəyişikliklər',
                  boxDescription:
                      'Pregnancy Yoga helps alleviate the effect of common symptoms such as morning sickness, painful leg cramps, swollen ankles, and constipation.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
