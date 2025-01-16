import 'package:flutter/material.dart';

import '../../../../../widgets/global_appbar.dart';
import 'widgets/all_indicators.dart';

class InitialAdvicePage extends StatelessWidget {
  const InitialAdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'baby 1',
        onTap: () {},
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
