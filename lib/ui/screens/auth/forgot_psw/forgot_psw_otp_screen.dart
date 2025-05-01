import 'package:burla_xatun/ui/widgets/global_appbar.dart';
import 'package:burla_xatun/ui/widgets/global_button.dart';
import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:burla_xatun/utils/constants/color_constants.dart';
import 'package:burla_xatun/utils/constants/padding_constants.dart';
import 'package:burla_xatun/utils/constants/text_constants.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class ForgotPswOtpScreen extends StatelessWidget {
  const ForgotPswOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final bool isKeyboardVisible = keyboardHeight > 0;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: GlobalAppbar(
          title: "",
          onLeadingTap: () {
            context.go("/email_request");
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
                          text: TextConstants.checkEmail,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                        12.h,
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "We've sent a code to ",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text: "test@example.com",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        38.h,
                        Center(
                          child: Pinput(
                            keyboardType: TextInputType.number,
                            length: 4,
                            defaultPinTheme: PinTheme(
                              width: 78,
                              height: 78,
                              textStyle: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorConstants.lightGray,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            focusedPinTheme: PinTheme(
                              width: 78,
                              height: 78,
                              textStyle: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorConstants.primaryRedColor,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
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
                  buttonName: TextConstants.verify,
                  buttonColor: ColorConstants.primaryRedColor,
                  textColor: ColorConstants.white,
                  onPressed: () {
                    context.pushReplacement("/reset_psw");
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
