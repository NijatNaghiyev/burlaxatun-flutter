import 'package:flutter/material.dart';

import '../../../../../widgets/global_text.dart';

class HeaderText extends StatelessWidget {
  final String title;

  const HeaderText({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GlobalText(
      textAlign: TextAlign.left,
      text: title,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }
}
