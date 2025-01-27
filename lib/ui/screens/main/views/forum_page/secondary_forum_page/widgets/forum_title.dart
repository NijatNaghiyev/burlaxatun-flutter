import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:flutter/material.dart';

class ForumTitle extends StatelessWidget {
  const ForumTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GlobalText(
          text: 'Hamiləlik və reproduktiv sağlamlıq',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ],
    );
  }
}
