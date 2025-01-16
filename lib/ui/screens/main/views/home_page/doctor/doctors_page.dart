import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'initial_doctor_page/initial_doctor_page.dart';
import 'registration_doctor_page/registration_doctor_page.dart';

class DoctorsPage extends StatelessWidget {
  DoctorsPage({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => InitialDoctorPage(),
      ),
      GoRoute(
        path: '/registration_doctor',
        builder: (context, state) => RegistrationDoctorPage(),
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
