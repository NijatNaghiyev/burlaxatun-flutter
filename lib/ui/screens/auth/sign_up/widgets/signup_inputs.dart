import 'package:burla_xatun/utils/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/signup_cubit/signup_cubit.dart';
import '../../../../../utils/extensions/context_extensions.dart';
import '../../../../widgets/global_input.dart';

class SignupInputs extends StatelessWidget {
  const SignupInputs({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignupCubit>();
    return Column(
      spacing: context.deviceHeight < 740 ? 13 : 26,
      children: [
        GlobalInput(
          focusNode: signUpCubit.signFullNameFocusNode,
          textController: signUpCubit.fullNameController,
          inputName: 'Name, Surname',
          hintText: 'Enter your name and surname',
          onFieldSubmitted: (v) {
            signUpCubit.signUpEmailFocusNode.requestFocus();
          },
          onChanged: (v) {
            signUpCubit.updateIsValid();
          },
        ),
        GlobalInput(
          textController: signUpCubit.emailController,
          focusNode: signUpCubit.signUpEmailFocusNode,
          inputName: TextConstants.email,
          hintText: TextConstants.enterYourEmail,
          onFieldSubmitted: (v) {
            signUpCubit.signUpPasswordFocusNode.requestFocus();
          },
          onChanged: (v) {
            signUpCubit.updateIsValid();
          },
        ),
        GlobalInput(
          textController: signUpCubit.passwordController,
          focusNode: signUpCubit.signUpPasswordFocusNode,
          inputName: TextConstants.password,
          hintText: TextConstants.enterYourPsw,
          onChanged: (v) {
            signUpCubit.updateIsValid();
          },
        ),
      ],
    );
  }
}
