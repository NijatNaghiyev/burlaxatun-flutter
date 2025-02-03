import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/login_cubit/login_cubit.dart';
import '../../../../../utils/constants/asset_constants.dart';
import '../../../../../utils/constants/text_constants.dart';
import '../../../../../utils/extensions/context_extensions.dart';
import '../../../../../utils/extensions/num_extensions.dart';
import '../../../../widgets/global_input.dart';

class LoginInputs extends StatelessWidget {
  const LoginInputs({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Form(
      key: loginCubit.loginFormKey,
      child: Column(
        children: [
          GlobalInput(
            textController: loginCubit.loginEmailController,
            focusNode: loginCubit.loginEmailFocusNode,
            inputName: TextConstants.email,
            prefixIcon: AssetConstants.emailIcon,
            hintText: TextConstants.emailiniziDaxilEdin,
            onFieldSubmitted: (p0) =>
                loginCubit.loginPasswordFocusNode.requestFocus(),
          
          ),
          context.deviceHeight < 750 ? 10.h : 26.h,
          BlocBuilder<LoginCubit, LoginCubitState>(
            builder: (context, state) {
              return GlobalInput(
                textController: loginCubit.loginPasswordController,
                focusNode: loginCubit.loginPasswordFocusNode,
                inputName: TextConstants.sifre,
                prefixIcon: 'assets/icons/lock_2.svg',
                hintText: TextConstants.sifreniziDaxilEdin,
                isObsecure: loginCubit.isObsecure,
                suffixIcon: loginCubit.isObsecure
                    ? AssetConstants.eyeSlashedIcon
                    : AssetConstants.eyeOpenIcon,
                onSuffixIcon: () => loginCubit.isObsecureToggle(),
               
              );
            },
          ),
        ],
      ),
    );
  }
}
