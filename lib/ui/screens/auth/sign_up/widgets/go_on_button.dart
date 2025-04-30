import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../cubits/signup_cubit/signup_cubit.dart';
import '../../../../../utils/constants/color_constants.dart';
import '../../../../widgets/global_button.dart';

class GoOnButton extends StatelessWidget {
  const GoOnButton({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = context.read<SignupCubit>();
    return BlocConsumer<SignupCubit, SignupCubitState>(
      listener: (context, state) {
        if (state is SignupCubitSuccess) {
          context.push('/questions');
        } else if (state is SignupCubitError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login failed!')),
          );
        }
      },
      builder: (context, state) {
        if (state is SignupCubitLoading) {
          return CircularProgressIndicator.adaptive();
        }
        return GlobalButton(
          buttonName: 'Davam et',
          buttonColor: signupCubit.isActiveButton
              ? ColorConstants.primaryRedColor
              : ColorConstants.inactiveDotColor,
          textColor: Colors.white,
          onPressed: () {
            signupCubit.register();
          },
        );
      },
    );
  }
}
