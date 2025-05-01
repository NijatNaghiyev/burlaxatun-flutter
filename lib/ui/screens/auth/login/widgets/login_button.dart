import 'dart:developer';

import 'package:burla_xatun/cubits/login_cubit/login_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../cubits/login_cubit/login_cubit.dart';
import '../../../../../utils/constants/color_constants.dart';
import '../../../../widgets/global_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return BlocConsumer<LoginCubit, LoginCubitInitial>(
      buildWhen: (previous, current) =>
          previous.loginStatus != current.loginStatus ||
          previous.isActiveButton != current.isActiveButton,
      listener: (BuildContext context, LoginCubitInitial state) {
        if (state.loginStatus == LoginStatus.success) {
          context.go('/home');
        } else if (state.loginStatus == LoginStatus.error) {
          loginCubit.errorState();
        }
      },
      builder: (context, state) {
        log('button builded');
        if (state.loginStatus == LoginStatus.loading) {
          return CircularProgressIndicator.adaptive();
        }
        return GlobalButton(
          buttonName: 'Daxil ol',
          buttonColor: state.isActiveButton
              ? ColorConstants.primaryRedColor
              : Colors.grey,
          textColor: Colors.white,
          onPressed: () {
            state.isActiveButton ? loginCubit.login() : null;
          },
        );
      },
    );
  }
}
