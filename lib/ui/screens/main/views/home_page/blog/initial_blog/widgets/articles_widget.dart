import 'package:burla_xatun/data/models/remote/response/blog_cat_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../../widgets/global_text.dart';

class ArticlesWidget extends StatelessWidget {
  final String title;
  final int itemCount;
  final List<Blog> blogs;

  const ArticlesWidget({
    super.key,
    required this.title,
    required this.itemCount,
    required this.blogs,
  });

  @override
  Widget build(BuildContext context) {
    // final mainCubit = context.read<MainnCubit>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GlobalText(
                text: title,
                //'Doğuşdan sonra bərpa',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              GestureDetector(
                onTap: () => context.push('/see_all_articles'),
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffE4C0ED),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Image.network(blog.file ?? ''),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9),
                        child: GlobalText(
                          text: blog.name ?? '',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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
