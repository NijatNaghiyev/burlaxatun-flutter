import '../../../../../../../widgets/global_button.dart';
import '../../../../../../../../utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

class ReRegistrationButton extends StatelessWidget {
  const ReRegistrationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalButton(
      height: 50,
      buttonName: 'Yeni Qeydiyyat',
      buttonColor: Color(0xffFDECF2),
      textColor: ColorConstants.primaryColor,
      onPressed: () {},
    );
  }
}
