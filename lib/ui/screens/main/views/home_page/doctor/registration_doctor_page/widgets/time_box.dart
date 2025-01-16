import 'package:flutter/material.dart';

import '../../../../../../../widgets/global_text.dart';

class TimeBox extends StatelessWidget {
  const TimeBox({
    super.key,
    required this.time,
  });

  final String time;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xffE8E8E8),
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: GlobalText(
              text: time,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff98A2B3),
            ),
          ),
        ),
      ),
    );
  }
}
