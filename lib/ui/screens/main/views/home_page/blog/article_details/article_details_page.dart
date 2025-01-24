import 'package:flutter/material.dart';

import 'widgets/article_detail.dart';
import 'widgets/article_details_appbar.dart';

class ArticleDetailsPage extends StatelessWidget {
  const ArticleDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE4C0ED),
      appBar: ArticleDetailsAppbar(),
      // body: SafeArea(
      //   child: ArticleDetailsAppbar(),
      // ),
      bottomSheet: ArticleDetail(),
    );
  }
}
