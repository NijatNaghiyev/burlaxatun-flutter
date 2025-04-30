import 'package:burla_xatun/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/onboarding_cubit/onboarding_cubit.dart';
import '../../../../data/models/local/onboarding_items_model.dart';
import '../../../../utils/constants/padding_constants.dart';
import '../../../../utils/extensions/num_extensions.dart';
import 'onboard_image.dart';
import 'onboard_title.dart';

class OnboardPageView extends StatelessWidget {
  const OnboardPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingCubit = context.read<OnboardingCubit>();
    return PageView.builder(
      controller: onboardingCubit.pageController,
      itemCount: onboardingCubit.onboardingItems.length,
      onPageChanged: (value) => onboardingCubit.updateIndexOfPage(value),
      itemBuilder: (_, index) {
        OnboardItemsModel item = onboardingCubit.onboardingItems[index];
        return SafeArea(
          child: Column(
            children: [
              (context.deviceHeight * 0.05).h,
              Text(
                item.onboardTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 24,
                ),
              ),
              Text(
                item.onboardTitleBold,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              (context.deviceHeight * 0.05).h,
              Expanded(
                child: OnboardImage(
                  onboardImage: item.onboardImage,
                ),
              ),
              Spacer(),
              // (context.deviceHeight * 0.05).h,
              Padding(
                padding: PaddingConstants.h18,
                child: OnboardTitle(
                  onboardTitle: item.onboardDescription,
                ),
              ),
              (context.deviceHeight * 0.05).h,
            ],
          ),
        );
      },
    );
  }
}
