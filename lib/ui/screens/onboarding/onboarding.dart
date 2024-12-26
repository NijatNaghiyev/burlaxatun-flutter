import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/onboarding_cubit/onboarding_cubit.dart';
import '../../../utils/constants/padding_constants.dart';
import 'widgets/onboard_button.dart';
import '../../widgets/global_dots.dart';
import 'widgets/onboard_page_view.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingCubit = context.read<OnboardingCubit>();
    return Scaffold(
      body: Padding(
        padding: PaddingConstants.t148 + PaddingConstants.h18,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              child: OnboardPageView(),
            ),
            Positioned(
              top: 330,
              child: GlobalDots(controller: onboardingCubit.pageController),
            ),
            Positioned(
              child: Padding(
                padding: EdgeInsets.only(top: 550),
                child: OnboardButton(
                  onPressed: () => onboardingCubit.jumptTo(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
