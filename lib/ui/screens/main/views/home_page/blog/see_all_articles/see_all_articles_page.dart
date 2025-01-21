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
        onTap: () {
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
                ArticleBox(),
                24.h,
                ArticleBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
