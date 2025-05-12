import 'package:burla_xatun/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../../../widgets/global_text.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({
    super.key,
    required this.doctorCategory,
    this.isSelected = false,
  });

  final String doctorCategory;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isSelected
              ? ColorConstants.primaryRedColorLight
              : ColorConstants.gray100,
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: GlobalText(
              text: doctorCategory,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isSelected
                  ? ColorConstants.primaryRedColor
                  : ColorConstants.gray400,
            ),
          ),
        ),
      ),
    );
  }
}
