import 'package:flutter/material.dart';

import '../../../../../../widgets/global_text.dart';

class FormatBox extends StatelessWidget {
  const FormatBox({
    super.key,
    required this.format,
    required this.onTap,
    required this.boxColors,
  });

  final String format;
  final void Function()? onTap;
  final Color boxColors;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: boxColors,
            borderRadius: BorderRadius.all(Radius.circular(18)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 57, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GlobalText(
                  text: format,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
