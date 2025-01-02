import 'package:burla_xatun/ui/widgets/global_button.dart';
import 'package:burla_xatun/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

class MoreDetailsButton extends StatelessWidget {
  const MoreDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalButton(
      buttonName: 'Daha ətraflı',
      buttonColor: Color(0xffFFD3E2),
      textColor: ColorConstants.primaryColor,
      onPressed: (){},
    );
  }
}
