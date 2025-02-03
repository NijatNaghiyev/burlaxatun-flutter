import 'package:flutter/material.dart';

import '../../../../../../widgets/global_text.dart';

class LastEditText extends StatelessWidget {
  const LastEditText({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalText(
      fontStyle: FontStyle.italic,
      text: 'Sonuncu düzəliş : 31 Dekabr 2024-cü il',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }
}
