import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/signup_cubit/signup_cubit.dart';
import '../../../../../utils/constants/color_constants.dart';
import '../../../../widgets/global_button.dart';

class GoOnButton extends StatelessWidget {
  const GoOnButton({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = context.read<SignupCubit>();
    return GlobalButton(
      buttonName: 'Davam et',
      buttonColor: ColorConstants.primaryColor,
      textColor: Colors.white,
      onPressed: () => signupCubit.goToQuestions(context),
    );
  }
}
