import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../utils/constants/color_constants.dart';
import '../../../../widgets/global_button.dart';

class GoOnButton extends StatelessWidget {
  const GoOnButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalButton(
      buttonName: 'Davam et',
      buttonColor: ColorConstants.primaryColor,
      textColor: Colors.white,
      onPressed: () {
        context.push('/questions');
      },
    );
  }
}
