import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/login_cubit/login_cubit.dart';
import '../../../../../utils/constants/asset_constants.dart';
import '../../../../../utils/constants/text_constants.dart';
import '../../../../../utils/extensions/num_extensions.dart';
import '../../../../widgets/global_input.dart';

class LoginInputs extends StatelessWidget {
  const LoginInputs({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Column(
      children: [
        GlobalInput(
          inputName: TextConstants.email,
          prefixIcon: AssetConstants.emailIcon,
          hintText: TextConstants.emailiniziDaxilEdin,
        ),
        26.h,
        BlocBuilder<LoginCubit, LoginCubitState>(
          builder: (context, state) {
            if (state is LoginCubitInitial) {
              return GlobalInput(
                inputName: TextConstants.sifre,
                prefixIcon: 'assets/icons/lock_2.svg',
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
