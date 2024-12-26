import 'package:flutter/material.dart';

import '../../../../../utils/constants/color_constants.dart';
import '../../../../widgets/global_button.dart';

class QuestionOneButton extends StatelessWidget {
  const QuestionOneButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
    // required this.optionIndex,
    required this.buttonColor,
    required this.borderColor,
  });

  final String buttonName;
  final void Function() onPressed;
  // final int optionIndex;
  final Color buttonColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GlobalButton(
        buttonName: buttonName,
        buttonColor: buttonColor,
        borderColor: borderColor,
        textColor: ColorConstants.primaryColor,
        onPressed: onPressed,
      ),
    );
  }
}
