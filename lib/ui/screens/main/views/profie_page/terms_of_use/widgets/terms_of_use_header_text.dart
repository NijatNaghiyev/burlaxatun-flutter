import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:flutter/material.dart';

class TermsOfUseHeaderText extends StatelessWidget {
  const TermsOfUseHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalText(
      textAlign: TextAlign.left,
      text: '“Burla Xatun” mobil tətbiqindən istifadə qaydaları',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }
}
