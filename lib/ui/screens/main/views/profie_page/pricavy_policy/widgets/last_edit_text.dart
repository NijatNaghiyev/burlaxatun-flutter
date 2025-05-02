import 'package:flutter/material.dart';

import '../../../../../../widgets/global_text.dart';

class LastEditText extends StatelessWidget {
  final String lastEditText;

  const LastEditText({
    super.key,
    required this.lastEditText,
  });

  @override
  Widget build(BuildContext context) {
    return GlobalText(
      fontStyle: FontStyle.italic,
      text: lastEditText,
      //'Sonuncu düzəliş : 31 Dekabr 2024-cü il',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }
}
