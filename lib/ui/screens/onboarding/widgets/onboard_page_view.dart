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
      onPageChanged: (value) => onboardingCubit.updateIndexOfPage(value.toDouble()),
      itemBuilder: (_, index) {
        OnboardItemsModel item = onboardingCubit.onboardingItems[index];
        return Column(
          children: [
            OnboardImage(onboardImage: item.onboardImage),
            113.h,
            Padding(
              padding: PaddingConstants.h18,
              child: OnboardTitle(onboardTitle: item.onboardTitle),
            )
          ],
        );
      },
    );
  }
}
