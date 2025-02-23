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
    return BlocConsumer<LoginCubit, LoginCubitState>(
      listener: (BuildContext context, LoginCubitState state) {
        if (state is LoginCubitSuccess) {
          context.go('/home');
        } else if (state is LoginCubitError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login failed!')),
          );
        }
      },
      builder: (context, state) {
        if (state is LoginCubitLoading) {
          return CircularProgressIndicator.adaptive();
        }
        return GlobalButton(
          buttonName: 'Daxil ol',
          buttonColor: loginCubit.isActiveButton
              ? ColorConstants.primaryColor
              : Colors.grey,
          textColor: Colors.white,
          onPressed: () {
            loginCubit.isActiveButton ? loginCubit.login() : null;
          },
        );
      },
    );
  }
}
