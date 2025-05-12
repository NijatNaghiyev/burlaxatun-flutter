import 'package:flutter/material.dart';

import '../../../../../widgets/global_text.dart';

class AdviseTitle extends StatelessWidget {
  final String adviceTitle;

  const AdviseTitle({super.key, required this.adviceTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GlobalText(
          textAlign: TextAlign.left,
          text: adviceTitle,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ],
    );
  }
}
