import 'package:flutter/material.dart';

import '../../../../../../widgets/global_text.dart';

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
