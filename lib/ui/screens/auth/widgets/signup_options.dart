import 'package:flutter/material.dart';

import '../../../../utils/constants/text_constants.dart';
import '../../../../utils/extensions/context_extensions.dart';
import '../../../../utils/extensions/num_extensions.dart';
import '../../../widgets/global_text.dart';

class SignupOptions extends StatelessWidget {
  const SignupOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GlobalText(
          text: 'OR',
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        context.deviceHeight < 710 ? 10.h : 24.h,
        OptionWidget(
          optionName: TextConstants.signUpWithGoogle,
          child: Image.asset(
            'assets/png/google_logo.png',
            width: 25,
            height: 25,
          ),
        ),
        10.h,
        OptionWidget(
          paddingRight: 39,
          optionName: TextConstants.videoDoktor,
          child: Image.asset(
            'assets/png/videodoctor_logo.png',
            width: 25,
            height: 25,
          ),
        ),
      ],
    );
  }
}

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    super.key,
    required this.optionName,
    required this.child,
    this.paddingRight = 0,
  });

  final String optionName;
  final Widget child;
  final double paddingRight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.maxFinite,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: Color(0xffD3D3D3),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child,
            Padding(
              padding: EdgeInsets.only(right: paddingRight),
              child: GlobalText(
                text: optionName,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
