import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/main/mainn_cubit.dart';
import 'utils/routes/router.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainnCubit(),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: Routerapp.instance.router,
      ),
    );
  }
}

// DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (BuildContext context) {
//         return MyApp();
//       },
//       // child: MyApp(),
//     ),
