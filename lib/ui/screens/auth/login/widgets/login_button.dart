import 'package:flutter/material.dart';

import '../../../../../utils/constants/color_constants.dart';
import '../../../../widgets/global_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalButton(
      buttonName: 'Daxil ol',
      buttonColor: ColorConstants.primaryColor,
      textColor: Colors.white,
      onPressed: () {},
    );
  }
}
