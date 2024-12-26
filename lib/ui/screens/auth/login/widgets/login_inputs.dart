import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/login_cubit/login_cubit.dart';
import '../../../../../utils/constants/asset_constants.dart';
import '../../../../../utils/constants/text_constants.dart';
import '../../../../../utils/extensions/num_extensions.dart';
import '../../widgets/auth_text_field.dart';

class LoginInputs extends StatelessWidget {
  const LoginInputs({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Column(
      children: [
        AuthTextField(
          inputName: TextConstants.email,
          prefixIcon: AssetConstants.emailIcon,
          hintText: TextConstants.emailiniziDaxilEdin,
        ),
        26.h,
        BlocBuilder<LoginCubit, LoginCubitState>(
          builder: (context, state) {
            if (state is LoginCubitInitial) {
              log('password field build');
              return AuthTextField(
                inputName: TextConstants.sifre,
                prefixIcon: AssetConstants.lockIcon,
                hintText: TextConstants.sifreniziDaxilEdin,
                isObsecure: state.isObsecure,
                suffixIcon: state.isObsecure
                    ? AssetConstants.eyeSlashedIcon
                    : AssetConstants.eyeOpenIcon,
                onSuffixIcon: () => loginCubit.isObsecureToggle(),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
