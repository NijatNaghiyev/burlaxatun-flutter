import 'package:flutter/material.dart';

import '../../../../utils/constants/padding_constants.dart';
import '../../../../utils/extensions/num_extensions.dart';
import '../widgets/signup_options.dart';
import 'widgets/forgot_password_button.dart';
import 'widgets/login_button.dart';
import 'widgets/login_image.dart';
import 'widgets/login_inputs.dart';
import 'widgets/signup_button.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: PaddingConstants.h20,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: PaddingConstants.t24,
                    child: LoginImage(),
                  ),
                  30.h,
                  LoginInputs(),
                  ForgotPasswordButton(),
                  10.h,
                  LoginButton(),
                  26.h,
                  SignupButton(),
                  25.h,
                  SignupOptions(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
