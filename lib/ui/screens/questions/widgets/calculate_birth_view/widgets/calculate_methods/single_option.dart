import 'package:burla_xatun/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../../widgets/global_text.dart';

class SingleOption extends StatelessWidget {
  const SingleOption({
    super.key,
    required this.optionName,
    required this.isSelectedOption,
  });

  final String optionName;
  final bool isSelectedOption;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.maxFinite,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isSelectedOption ? Color(0xffFFD3E2) : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(34)),
          border: Border.all(
              color: isSelectedOption ? Colors.transparent : Color(0xffEAEAEA)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              GlobalText(
                text: optionName,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isSelectedOption
                    ? ColorConstants.primaryRedColor
                    : Color(0xff475467),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
