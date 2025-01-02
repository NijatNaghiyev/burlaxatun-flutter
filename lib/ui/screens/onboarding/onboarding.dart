import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/onboarding_cubit/onboarding_cubit.dart';
import '../../widgets/global_dots.dart';
import 'widgets/onboard_button.dart';
import 'widgets/onboard_page_view.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingCubit = context.read<OnboardingCubit>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 121, bottom: 67),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 25, left: 20, right: 20),
        child: OnboardButton(),
      ),
    );
  }
}
