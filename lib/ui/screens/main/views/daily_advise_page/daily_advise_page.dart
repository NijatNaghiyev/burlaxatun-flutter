import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'body_weight_view/body_weight_page.dart';
import 'initial_advice_view/initial_advice_page.dart';

class DailyAdvisePage extends StatelessWidget {
  DailyAdvisePage({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => InitialAdvicePage(),
      ),
      GoRoute(
        path: '/body_weight',
        builder: (context, state) => BodyWeightPage(),
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
