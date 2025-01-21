import 'package:flutter/material.dart';

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
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: Routerapp.instance.router,
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
