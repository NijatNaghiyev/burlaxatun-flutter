import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'blog_views/article_details/article_details_page.dart';
import 'blog_views/initial_blog/blog_page.dart';
import 'blog_views/see_all_articles/see_all_articles_page.dart';

class BlogView extends StatelessWidget {
  BlogView({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlogPage(),
      ),
      GoRoute(
        path: '/see_all',
        builder: (context, state) => SeeAllArticlesPage(),
      ),
      GoRoute(
        path: '/article_details',
        builder: (context, state) => ArticleDetailsPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
