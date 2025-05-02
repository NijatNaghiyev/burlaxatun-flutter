import 'package:flutter/material.dart';

import '../../../../../../widgets/global_text.dart';

class PrivacyPolicyHeader extends StatelessWidget {
  final String headerTitle;
  const PrivacyPolicyHeader({super.key, required this.headerTitle});

  @override
  Widget build(BuildContext context) {
    return GlobalText(
      textAlign: TextAlign.left,
      text: headerTitle,
      //'“Burla Xatun” internet portalı və mobil tətbiq üzrə Məxfilik Siyasəti',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }
}
