import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:flutter/material.dart';

class TermsOfUseTitle extends StatelessWidget {
  const TermsOfUseTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalText(
      textAlign: TextAlign.left,
      decoration: TextDecoration.underline,
      text: 'Mobil tətbiqi və portaldan istifadə',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }
}
