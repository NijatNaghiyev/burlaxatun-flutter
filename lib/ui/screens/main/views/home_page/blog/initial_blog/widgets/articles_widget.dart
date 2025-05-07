import 'package:burla_xatun/data/models/remote/response/blog_cat_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../../widgets/global_text.dart';

class ArticlesWidget extends StatelessWidget {
  final String title;
  final int itemCount;
  final List<Blog> blogs;
  final Result category;

  const ArticlesWidget({
    super.key,
    required this.title,
    required this.itemCount,
    required this.blogs,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GlobalText(
                text: title,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              GestureDetector(
                onTap: () => context.push(
                  '/see_all_articles',
                  extra: category,
                ),
                child: GlobalText(
                  text: 'Ətraflı',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        12.h,
        SizedBox(
          height: 175,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: blogs.length,
            itemBuilder: (_, index) {
              final blog = blogs[index];
              return GestureDetector(
                onTap: () => context.push('/article_details', extra: blog),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.37,
                  margin: EdgeInsets.only(left: index == 0 ? 15 : 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          blog.file ?? '',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(child: Icon(Icons.error)),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 9,
                          right: 9,
                          child: GlobalText(
                            text: blog.name ?? '',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        24.h,
      ],
    );
  }
}
