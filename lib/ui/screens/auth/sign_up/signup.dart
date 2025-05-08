import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/constants/padding_constants.dart';
import '../../../../utils/extensions/context_extensions.dart';
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
      appBar: GlobalAppbar(
        title: 'Qeydiyyat',
        leading: SizedBox.shrink(),
        // onLeadingTap: () => context.pop(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingConstants.h20,
          child: Column(
            children: [
              context.deviceHeight < 710 ? 10.h : 51.h,
              SignupInputs(),
              context.deviceHeight < 710 ? 17.h : 15.h,
              AcceptPolicyCheckBox(),
              context.deviceHeight < 710 ? 14.h : 29.h,
              GoOnButton(),
              context.deviceHeight < 710 ? 10.h : 20.h,
              LoginTextButton(),
              context.deviceHeight < 710 ? 8.h : 16.h,
              SignupOptions()
            ],
          ),
        ),
      ),
    );
  }
}
