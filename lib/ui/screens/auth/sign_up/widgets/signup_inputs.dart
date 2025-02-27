import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/signup_cubit/signup_cubit.dart';
import '../../../../../utils/constants/asset_constants.dart';
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
          textController: signUpCubit.signFullNameController,
          inputName: 'Ad, soyad və ata adı qeyd edin',
          prefixIcon: AssetConstants.userIcon,
          hintText: 'Adınızı qeyd edin',
          onFieldSubmitted: (v) {
            signUpCubit.signUpEmailFocusNode.requestFocus();
          },
          onChanged: (v) {
            signUpCubit.updateIsValid();
          },
        ),
        GlobalInput(
          textController: signUpCubit.signUpEmailController,
          focusNode: signUpCubit.signUpEmailFocusNode,
          inputName: 'Email',
          prefixIcon: AssetConstants.emailIcon,
          hintText: 'Email qeyd edin',
          onFieldSubmitted: (v) {
            signUpCubit.signUpPasswordFocusNode.requestFocus();
          },
          onChanged: (v) {
            signUpCubit.updateIsValid();
          },
        ),
        GlobalInput(
          textController: signUpCubit.signUpPasswordController,
          focusNode: signUpCubit.signUpPasswordFocusNode,
          inputName: 'Şifrə',
          prefixIcon: AssetConstants.lockIcon,
          hintText: 'Şifrənizi qeyd edin',
          onChanged: (v) {
            signUpCubit.updateIsValid();
          },
        ),
      ],
    );
  }
}
