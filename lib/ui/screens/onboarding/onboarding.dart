import '../../../utils/constants/padding_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/onboarding_cubit/onboarding_cubit.dart';
import 'widgets/onboard_button.dart';
import 'widgets/onboard_dots.dart';
import 'widgets/onboard_page_view.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingCubit = context.read<OnboardingCubit>();
    return Scaffold(
      body: Padding(
        padding: PaddingConstants.t148,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: OnboardPageView(),
            ),
            Positioned(
              top: 330,
              child:
                  OnboardDots(controller: onboardingCubit.pageController),
            ),
            Positioned(
              top: 550,
              child: OnboardButton(
                onPressed: () => onboardingCubit.jumptTo(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
