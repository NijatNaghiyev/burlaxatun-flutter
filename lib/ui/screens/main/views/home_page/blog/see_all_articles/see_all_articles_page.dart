import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../data/models/remote/response/blog_cat_model.dart';
import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_appbar.dart';
import '../../widgets/article_box.dart';

class SeeAllArticlesPage extends StatelessWidget {
  const SeeAllArticlesPage({super.key, required this.category});
  final Result category; //

  @override
  Widget build(BuildContext context) {
    final blogs = category.blogs ?? [];

    return Scaffold(
      appBar: GlobalAppbar(
        title: category.name ?? 'Blog',
        onLeadingTap: () => context.pop(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              22.h,
              ...blogs.map((blog) => Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: ArticleBox(
                      onTap: () =>
                          context.push('/article_details', extra: blog),
                      videoOrImage: Image.network(
                        blog.file ?? '',
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(Icons.error),
                      ),
                      boxTitle: blog.name ?? '',
                      boxDescription: blog.text ?? '',
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
