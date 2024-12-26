import 'package:flutter/material.dart';

import '../../../../utils/constants/color_constants.dart';
import '../../../../utils/constants/text_constants.dart';
import '../../../widgets/global_button.dart';

class OnboardButton extends StatelessWidget {
  const OnboardButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GlobalButton(
      buttonName: TextConstants.davamEt,
      buttonColor: ColorConstants.primaryColor,
      textColor: Colors.white,
      onPressed: onPressed,
    );
  }
}
