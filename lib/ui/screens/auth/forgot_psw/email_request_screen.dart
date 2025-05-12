import 'package:burla_xatun/ui/widgets/global_appbar.dart';
import 'package:burla_xatun/ui/widgets/global_button.dart';
import 'package:burla_xatun/ui/widgets/global_input.dart';
import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:burla_xatun/utils/constants/asset_constants.dart';
import 'package:burla_xatun/utils/constants/color_constants.dart';
import 'package:burla_xatun/utils/constants/padding_constants.dart';
import 'package:burla_xatun/utils/constants/text_constants.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmailRequestScreen extends StatelessWidget {
  const EmailRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final bool isKeyboardVisible = keyboardHeight > 0;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: GlobalAppbar(
          title: '',
          onLeadingTap: () {
            context.pop();
          },
        ),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: PaddingConstants.h20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        30.h,
                        GlobalText(
                          text: TextConstants.changePsw,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                        12.h,
                        GlobalText(
                          text: TextConstants.dontWorry,
                        ),
                        24.h,
                        GlobalInput(
                          hintText: TextConstants.enterYourEmail,
                          prefixIcon: AssetConstants.emailIcon,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: isKeyboardVisible ? 20 : 32,
                ),
                child: GlobalButton(
                  buttonName: TextConstants.sendCode,
                  buttonColor: ColorConstants.primaryRedColor,
                  textColor: ColorConstants.white,
                  onPressed: () {
                    context.go(
                      "/forgot_psw_otp",
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
