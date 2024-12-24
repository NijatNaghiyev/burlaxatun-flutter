import '../../../../utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardDots extends StatelessWidget {
  const OnboardDots({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: CustomizableEffect(
        spacing: 6,
        dotDecoration: DotDecoration(
          width: 37,
          color: ColorConstants.inactiveDotColor,
          borderRadius: BorderRadius.all(Radius.circular(19)),
        ),
        activeDotDecoration: DotDecoration(
          width: 16,
          color: ColorConstants.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(19)),
        ),
      ),
    );
  }
}