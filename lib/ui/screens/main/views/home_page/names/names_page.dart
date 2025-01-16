import 'package:burla_xatun/ui/screens/main/views/home_page/names/widgets/countries_and_selecteds/countries_and_selecteds.dart';
import 'package:burla_xatun/ui/screens/main/views/home_page/names/widgets/selectable_gender/selectable_gender.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NamesPage extends StatelessWidget {
  NamesPage({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => CountriesAndSelecteds(),
      ),
      GoRoute(
        path: '/gender',
        builder: (context, state) => SelectableGender(),
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
