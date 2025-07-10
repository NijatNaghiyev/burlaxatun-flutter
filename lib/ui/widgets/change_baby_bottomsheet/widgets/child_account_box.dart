import 'package:flutter/material.dart';

import '../../../../utils/extensions/context_extensions.dart';
import '../../global_text.dart';

class ChildAccountBox extends StatelessWidget {
  const ChildAccountBox({
    super.key,
    required this.babyName,
  });
  final String babyName;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(42)),
          border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12) +
            EdgeInsets.only(left: 23, right: 46),
        child: Row(
          children: [
            Image.asset(
              'assets/png/baby_acc_pic.png',
              width: 52,
              height: 52,
            ),
            SizedBox(width: 12),
            SizedBox(
              width: context.deviceWidth * 0.58,
              child: GlobalText(
                height: 1.4,
                textAlign: TextAlign.left,
                text: babyName,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
