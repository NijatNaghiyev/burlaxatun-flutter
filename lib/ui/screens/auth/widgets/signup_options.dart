import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constants/asset_constants.dart';
import '../../../../utils/constants/text_constants.dart';
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
        24.h,
        OptionWidget(
          optionName: TextConstants.signUpWithGoogle,
          optionIcon: AssetConstants.googleIcon,
        ),
        10.h,
        OptionWidget(
          optionName: TextConstants.videoDoktor,
          optionIcon: AssetConstants.videoDoctor,
        ),
      ],
    );
  }
}

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    super.key,
    required this.optionName,
    required this.optionIcon,
  });

  final String optionName;
  final String optionIcon;

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
            SvgPicture.asset(optionIcon),
            GlobalText(
              text: optionName,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
