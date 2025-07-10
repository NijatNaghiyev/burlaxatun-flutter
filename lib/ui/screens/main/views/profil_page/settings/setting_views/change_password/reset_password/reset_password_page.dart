import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../utils/constants/color_constants.dart';
import '../../../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../../../widgets/global_appbar.dart';
import '../../../../../../../../widgets/global_button.dart';
import '../../../../../../../../widgets/global_text.dart';
import '../success_change_password/success_change_password.dart';
import 'widgets/reset_password_inputs.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GlobalAppbar(
        title: ' ',
        onLeadingTap: () => context.pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.h,
              GlobalText(
                textAlign: TextAlign.left,
                text: 'Parolu sıfırlayın',
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              17.h,
              GlobalText(
                height: 1.3,
                textAlign: TextAlign.left,
                text: 'Xahiş edirəm xatırlayacağınız bir şey yazın',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(130, 0, 0, 0),
              ),
              25.h,
              ResetPasswordInputs(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15) +
            EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 32),
        child: GlobalButton(
          height: 50,
          buttonName: 'Parolu sıfırlayın',
          buttonColor: ColorConstants.primaryRedColor,
          textColor: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SuccessChangePassword(),
              ),
            );
          },
        ),
      ),
    );
  }
}
