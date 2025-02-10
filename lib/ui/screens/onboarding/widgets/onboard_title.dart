import 'package:flutter/material.dart';

import '../../../widgets/global_text.dart';

class OnboardTitle extends StatelessWidget {
  const OnboardTitle({
    super.key,
    required this.onboardTitle,
  });

  final String onboardTitle;

  @override
  Widget build(BuildContext context) {
    return GlobalText(
      text: onboardTitle,
      fontSize: 34,
      height: 1.2,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }
}


