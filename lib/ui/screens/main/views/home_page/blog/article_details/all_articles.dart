import 'package:burla_xatun/cubits/blog_cat/blog_cat_cubit.dart';
import 'package:burla_xatun/ui/screens/main/views/home_page/blog/initial_blog/widgets/articles_widget.dart';
import 'package:burla_xatun/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllArticles extends StatelessWidget {
  final String searchQuery;

  const AllArticles({super.key, required this.searchQuery});

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
          final results = state.response?.results ?? [];

          final filtered = results.where((result) {
            final name = result.name?.toLowerCase() ?? '';
            return name.contains(searchQuery.toLowerCase());
          }).toList();

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filtered.length,
            itemBuilder: (_, index) {
              final category = filtered[index];
              return ArticlesWidget(
                title: category.name ?? '',
                itemCount: category.blogs?.length ?? 0,
                blogs: category.blogs ?? [],
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
