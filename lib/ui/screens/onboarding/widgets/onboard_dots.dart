import '../../../../cubits/onboarding_cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/color_constants.dart';

class OnboardDots extends StatelessWidget {
  const OnboardDots({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingCubit = context.read<OnboardingCubit>();
    return SmoothPageIndicator(
      controller: onboardingCubit.pageController,
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
