import 'package:burla_xatun/ui/screens/main/views/profie_page/settings/setting_views/change_password/reset_password/reset_password_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../utils/constants/color_constants.dart';
import '../../../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../../../widgets/global_appbar.dart';
import '../../../../../../../../widgets/global_button.dart';
import '../../../../../../../../widgets/global_text.dart';
import 'widgets/pinput_widget.dart';
import 'widgets/send_to_email_rich_text.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

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
              text: 'Please check your email',
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            17.h,
            SendToEmailRichText(),
            38.h,
            Center(
              child: PinputWidget(),
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
                builder: (_) => ResetPasswordPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
