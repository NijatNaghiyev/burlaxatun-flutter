import 'package:flutter/material.dart';

import '../../../../../../widgets/global_text.dart';

class PrivacyPolicyTitle extends StatelessWidget {
  const PrivacyPolicyTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalText(
      textAlign: TextAlign.left,
      decoration: TextDecoration.underline,
      text: 'Sağlamıq haqqında məlumatların məxfiliyinə dari bildiriş',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }
}
