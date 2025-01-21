import 'package:flutter/material.dart';

import '../../../../../../widgets/global_text.dart';

class SingleOption extends StatelessWidget {
  const SingleOption({
    super.key,
    required this.boxTitle,
    required this.onTap,
    required this.boxColors,
  });

  final String boxTitle;
  final void Function() onTap;
  final Color boxColors;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 140,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: boxColors,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: GlobalText(
                  text: boxTitle,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
