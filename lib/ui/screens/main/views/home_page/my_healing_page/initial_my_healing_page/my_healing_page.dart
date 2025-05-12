import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../widgets/global_appbar.dart';
import 'widgets/all_indicators.dart';

class MyHealingPage extends StatelessWidget {
  const MyHealingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'baby 1',
        onLeadingTap: () {
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AllIndicators(),
        ),
      ),
    );
  }
}
