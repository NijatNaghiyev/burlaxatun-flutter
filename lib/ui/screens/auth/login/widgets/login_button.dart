import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/login_cubit/login_cubit.dart';
import '../../../../../utils/constants/color_constants.dart';
import '../../../../widgets/global_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginCubitState>(
      builder: (context, state) {
        return GlobalButton(
          buttonName: 'Daxil ol',
          buttonColor: loginCubit.isActiveButton
              ? ColorConstants.primaryColor
              : Colors.grey,
          textColor: Colors.white,
          onPressed: () {},
        );
      },
    );
  }
}
