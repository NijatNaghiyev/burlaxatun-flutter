import 'package:flutter/material.dart';

import '../../../../../../widgets/global_text.dart';

class PrivacyPolicyTitle extends StatelessWidget {
  final String title;

  const PrivacyPolicyTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GlobalText(
      textAlign: TextAlign.left,
      decoration: TextDecoration.underline,
      text: title,
      //'Sağlamıq haqqında məlumatların məxfiliyinə dari bildiriş',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }
}
