import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/onboarding_cubit/onboarding_cubit.dart';
import '../../../../utils/constants/color_constants.dart';
import '../../../../utils/constants/text_constants.dart';
import '../../../widgets/global_button.dart';

class OnboardButton extends StatelessWidget {
  const OnboardButton({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingCubit = context.read<OnboardingCubit>();
    return GlobalButton(
      buttonName: TextConstants.davamEt,
      buttonColor: ColorConstants.primaryRedColor,
      textColor: Colors.white,
      onPressed: () => onboardingCubit.jumptTo(context),
    );
  }
}
