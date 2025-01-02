import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/onboarding_cubit/onboarding_cubit.dart';
import 'ui/screens/onboarding/onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (BuildContext context) => OnboardingCubit(),
        child: Onboarding(),
      ),
    );
  }
}

//  DevicePreview(
//       enabled: true,
//       builder: (context) => MyApp(),
//     ),
