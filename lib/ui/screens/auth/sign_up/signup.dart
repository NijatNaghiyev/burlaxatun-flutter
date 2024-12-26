import 'package:flutter/material.dart';

import '../../../../utils/constants/padding_constants.dart';
import '../../../../utils/extensions/num_extensions.dart';
import '../../../widgets/global_appbar.dart';
import '../widgets/signup_options.dart';
import 'widgets/accept_policy_check_box.dart';
import 'widgets/go_on_button.dart';
import 'widgets/login_text_button.dart';
import 'widgets/signup_inputs.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(),
      body: Padding(
        padding: PaddingConstants.h20,
        child: Column(
          children: [
            51.h,
            SignupInputs(),
            15.h,
            AcceptPolicyCheckBox(),
            29.h,
            GoOnButton(),
            20.h,
            LoginTextButton(),
            16.h,
            SignupOptions()
          ],
        ),
      ),
    );
  }
}
