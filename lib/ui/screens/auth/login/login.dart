import 'package:burla_xatun/ui/screens/auth/widgets/auth_text_field.dart';
import 'package:burla_xatun/utils/constants/asset_constants.dart';
import 'package:burla_xatun/utils/constants/padding_constants.dart';
import 'package:burla_xatun/utils/constants/text_constants.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import 'widgets/login_image.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: PaddingConstants.t24,
                child: LoginImage(),
              ),
              30.h,
              AuthTextField(
                inputName: TextConstants.email,
                prefixIcon: AssetConstants.emailIcon,
                hintText: 'E-mailinizi daxil edin',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
