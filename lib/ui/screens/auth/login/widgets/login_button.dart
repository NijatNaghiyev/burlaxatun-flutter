import 'package:burla_xatun/cubits/login_cubit/login_cubit_state.dart';
import 'package:burla_xatun/ui/screens/auth/widgets/custom_auth_button.dart';
import 'package:burla_xatun/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:burla_xatun/utils/app/app_snackbars.dart';
import 'package:burla_xatun/utils/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../cubits/login_cubit/login_cubit.dart';
import '../../../../../utils/constants/color_constants.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return BlocConsumer<LoginCubit, LoginCubitInitial>(
      buildWhen: (previous, current) =>
          previous.loginStatus != current.loginStatus ||
          previous.isActiveButton != current.isActiveButton,
      listener: (_, state) {
        if (state.loginStatus == LoginStatus.success) {
          context.go('/home');
        }
        if (state.loginStatus == LoginStatus.error) {
          loginCubit.errorState();
        }
        if (state.loginStatus == LoginStatus.networkError) {
          loginCubit.errorState();
          // AppSnackbars.error(context, 'Şəbəkəni yoxlayın');
        }
      },
      builder: (_, state) {
        return CustomAuthButton(
          buttonColor: state.isActiveButton
              ? ColorConstants.primaryRedColor
              : ColorConstants.disabledButtonColor,
          textColor: ColorConstants.white,
          onPressed: () {
            if (state.loginStatus == LoginStatus.loading) return;
            if (loginCubit.loginEmailController.text.isNotEmpty &&
                loginCubit.loginPasswordController.text.isNotEmpty) {
              state.isActiveButton ? loginCubit.login() : null;
            }
          },
          child: state.loginStatus == LoginStatus.loading
              ? CustomCircularProgressIndicator()
              : GlobalText(
                  text: TextConstants.daxilOl,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
        );
      },
    );
  }
}
