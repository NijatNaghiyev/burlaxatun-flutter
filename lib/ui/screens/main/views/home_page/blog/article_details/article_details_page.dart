import 'package:burla_xatun/data/models/remote/response/blog_cat_model.dart';
import 'package:flutter/material.dart';

import 'widgets/article_detail.dart';
import 'widgets/article_details_appbar.dart';

class ArticleDetailsPage extends StatelessWidget {
  final Blog blog;

  const ArticleDetailsPage({
    super.key,
    required this.blog,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE4C0ED),
      appBar: ArticleDetailsAppbar(
        imagePath: blog.file ?? '',
      ),
      bottomSheet: ArticleDetail(
        title: blog.name ?? '',
        text: blog.text ?? '',
      ),
    );
  }
}
