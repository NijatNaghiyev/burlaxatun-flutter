import 'package:burla_xatun/utils/constants/asset_constants.dart';
import 'package:burla_xatun/utils/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/signup_cubit/signup_cubit.dart';
import '../../../../../utils/extensions/context_extensions.dart';
import '../../../../widgets/global_input.dart';

class SignupInputs extends StatelessWidget {
  const SignupInputs({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignupCubit>();
    final ValueNotifier<bool> isObsecure = ValueNotifier<bool>(true);
    return Form(
      key: formKey,
      child: Column(
        spacing: context.deviceHeight < 740 ? 13 : 26,
        children: [
          GlobalInput(
            inputName: 'Phone',
            hintText: '+994 xxx xxx xx xx',
            textController: signUpCubit.phoneController,
            focusNode: signUpCubit.phoneFocusNode,
            isNumber: true,
            onFieldSubmitted: (v) {
              signUpCubit.fullNameFocusNode.requestFocus();
            },
            onChanged: (v) {
              signUpCubit.updateIsValid();
            },
          ),
          GlobalInput(
            focusNode: signUpCubit.fullNameFocusNode,
            textController: signUpCubit.fullNameController,
            inputName: 'Name, Surname',
            hintText: 'Enter your name and surname',
            onFieldSubmitted: (v) {
              signUpCubit.emailFocusNode.requestFocus();
            },
            onChanged: (v) {
              signUpCubit.updateIsValid();
            },
            validator: (fullName) {
              final parts = fullName!.trim().split(' ');
              if (parts.length != 2) {
                return 'Ad ve soyadi duzgun daxil edin';
              }
              return null;
            },
          ),
          GlobalInput(
            textController: signUpCubit.emailController,
            focusNode: signUpCubit.emailFocusNode,
            inputName: TextConstants.email,
            hintText: TextConstants.enterYourEmail,
            validator: (email) {
              final emailValidity = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(email!);
              if (!emailValidity) {
                return 'Email formati duzgun deyil';
              }
              return null;
            },
            onFieldSubmitted: (v) {
              signUpCubit.passwordFocusNode.requestFocus();
            },
            onChanged: (v) {
              signUpCubit.updateIsValid();
            },
          ),
          ValueListenableBuilder(
            valueListenable: isObsecure,
            builder: (context, value, child) {
              return GlobalInput(
                textController: signUpCubit.passwordController,
                focusNode: signUpCubit.passwordFocusNode,
                inputName: TextConstants.password,
                hintText: TextConstants.enterYourPsw,
                isObsecure: value,
                suffixIcon: value
                    ? AssetConstants.eyeClosedIcon
                    : AssetConstants.eyeOpenedIcon,
                onSuffixIconTap: () {
                  isObsecure.value = !isObsecure.value;
                },
                onChanged: (v) {
                  signUpCubit.updateIsValid();
                },
                validator: (password) {
                  if (password!.length < 8) {
                    return 'Sifre en azi 8 herfli olmalidir';
                  }
                  return null;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
