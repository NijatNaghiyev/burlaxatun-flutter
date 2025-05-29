import 'package:burla_xatun/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../../../widgets/global_text.dart';

class SingleTimeIntervalBox extends StatelessWidget {
  const SingleTimeIntervalBox({
    super.key,
    required this.interval,
    required this.isSelected,
  });

  final String interval;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: isSelected ? ColorConstants.primaryRedColor : Color(0xffE8E8E8),
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
    );
  }
}
