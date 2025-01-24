import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:flutter/material.dart';

class LastVersionText extends StatelessWidget {
  const LastVersionText({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalText(
      fontStyle: FontStyle.italic,
      text: 'Son versiya : 31 Dekabr 2024-cü il',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }
}
