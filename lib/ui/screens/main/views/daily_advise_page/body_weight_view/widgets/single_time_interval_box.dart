import 'package:flutter/material.dart';

import '../../../../../../widgets/global_text.dart';

class SingleTimeIntervalBox extends StatelessWidget {
  const SingleTimeIntervalBox({
    super.key,
    required this.interval,
  });

  final String interval;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xffE8E8E8),
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: GlobalText(
              text: interval,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
