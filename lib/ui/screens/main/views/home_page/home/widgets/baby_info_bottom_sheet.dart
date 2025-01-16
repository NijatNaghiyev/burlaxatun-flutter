import 'package:flutter/material.dart';

import '../../../../../../../utils/extensions/context_extensions.dart';
import 'baby_text.dart';

class BabyInfoBottomSheet extends StatelessWidget {
  const BabyInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceHeight * 0.75,
      width: context.deviceWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BabyText(),
            ],
          ),
        ),
      ),
    );
  }
}
