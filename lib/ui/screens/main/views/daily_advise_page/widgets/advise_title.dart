import '../../../../../widgets/global_text.dart';
import 'package:flutter/material.dart';

class AdviseTitle extends StatelessWidget {
  const AdviseTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GlobalText(
          textAlign: TextAlign.left,
          text: 'O qədər yorğunam ki',
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ],
    );
  }
}
