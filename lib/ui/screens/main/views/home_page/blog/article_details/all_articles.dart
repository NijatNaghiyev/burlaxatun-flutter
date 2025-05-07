import 'package:burla_xatun/cubits/blog_cat/blog_cat_cubit.dart';
import 'package:burla_xatun/ui/screens/main/views/home_page/blog/initial_blog/widgets/articles_widget.dart';
import 'package:burla_xatun/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllArticles extends StatelessWidget {
  const AllArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogCatCubit, BlogCatState>(
      builder: (_, state) {
        if (state.status == BlogCatStatus.loading) {
          return const Center(child: CustomCircularProgressIndicator());
        }

        if (state.status == BlogCatStatus.failure) {
          return const Center(child: Text('Error'));
        }

        if (state.status == BlogCatStatus.networkError) {
          return const Center(child: Text('Network Error'));
        }

        if (state.status == BlogCatStatus.success) {
          final data = state.response;
          final results = data?.results ?? [];

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data?.count,
            itemBuilder: (_, index) {
              final category = results[index];
              final blogs = category.blogs ?? [];
              return ArticlesWidget(
                title: category.name ?? '',
                itemCount: blogs.length,
                blogs: blogs,
                category: category,
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
