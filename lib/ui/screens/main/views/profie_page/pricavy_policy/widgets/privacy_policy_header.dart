import 'package:flutter/material.dart';

import '../../../../../../widgets/global_text.dart';

class PrivacyPolicyHeader extends StatelessWidget {
  const PrivacyPolicyHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlobalText(
      textAlign: TextAlign.left,
      text:
          '“Burla Xatun” internet portalı və mobil tətbiq üzrə Məxfilik Siyasəti',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }
}
