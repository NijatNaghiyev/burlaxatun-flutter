import 'package:flutter/material.dart';

import '../../../../../../../../../utils/constants/color_constants.dart';
import '../../../../../../../../widgets/global_text.dart';

class EditDetailsButton extends StatelessWidget {
  const EditDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 117,
      child: ElevatedButton(
        style: ButtonStyle(
          shadowColor: const WidgetStatePropertyAll(Colors.transparent),
          backgroundColor: WidgetStatePropertyAll(Colors.white),
          side: WidgetStatePropertyAll(
            BorderSide(color: ColorConstants.primaryRedColor),
          ),
        ),
        onPressed: () {},
        child: GlobalText(
          text: 'Düzəliş et',
          fontSize: 14,
          height: 1.1,
          fontWeight: FontWeight.w500,
          color: ColorConstants.primaryRedColor,
        ),
      ),
    );
  }
}
