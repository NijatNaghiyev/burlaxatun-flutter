import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../utils/constants/color_constants.dart';
import '../../../../../widgets/global_appbar.dart';
import 'widgets/contact_us_box.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.profileScaffoldColor,
      appBar: GlobalAppbar(
        title: 'Bizimle elaqe saxla',
        onLeadingTap: () {
          context.pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            spacing: 24,
            children: [
              ContactUsBox(
                contactTitle: 'Bizə zəng edin',
                contactDescription: 'Sual və təklifiniz var ?',
                icon: 'assets/icons/contact_us_call_icon.svg',
                iconColor: Color(0xffEC407A),
              ),
              ContactUsBox(
                contactTitle: 'Whatsapp',
                contactDescription: 'Bizə onlayn yazın',
                icon: 'assets/icons/contact_us_call_icon.svg',
                iconColor: Color(0xff00D95F),
              ),
              ContactUsBox(
                contactTitle: 'Email',
                contactDescription: '24/7 xidmətinizdəyik',
                icon: 'assets/icons/contact_us_email_icon.svg',
                iconColor: Color(0xff0BA5EC),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
