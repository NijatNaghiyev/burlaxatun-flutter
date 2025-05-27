import 'package:burla_xatun/ui/screens/main/views/profil_page/settings/setting_views/change_password/otp_page/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../utils/constants/asset_constants.dart';
import '../../../../../../../../../utils/constants/color_constants.dart';
import '../../../../../../../../../utils/constants/text_constants.dart';
import '../../../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../../../widgets/global_appbar.dart';
import '../../../../../../../../widgets/global_button.dart';
import '../../../../../../../../widgets/global_input.dart';
import '../../../../../../../../widgets/global_text.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            50.h,
            GlobalText(
              textAlign: TextAlign.left,
              text: 'Şifrəni dəyiş',
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            17.h,
            GlobalText(
              height: 1.3,
              textAlign: TextAlign.left,
              text:
                  'Don’t worry! It happens. Please enter the email associated with your account.',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(130, 0, 0, 0),
            ),
            24.h,
            GlobalInput(
              inputName: TextConstants.email,
              prefixIcon: AssetConstants.emailIcon,
              hintText: TextConstants.enterYourEmail,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15) +
            EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 32),
        child: GlobalButton(
          height: 50,
          buttonName: 'Send code',
          buttonColor: ColorConstants.primaryRedColor,
          textColor: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => OtpPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
