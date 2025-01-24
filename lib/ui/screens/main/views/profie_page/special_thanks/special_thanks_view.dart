import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../widgets/global_appbar.dart';

class SpecialThanksView extends StatelessWidget {
  const SpecialThanksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'xususi teshekkurler',
        onTap: () {
          context.pop();
        },
      ),
      body: Container(),
    );
  }
}
