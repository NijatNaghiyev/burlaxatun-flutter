import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:flutter/material.dart';

class LastDays extends StatelessWidget {
  const LastDays({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalText(
      text: 'Last 7 days',
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }
}
