import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../utils/constants/color_constants.dart';
import '../../../../../../../widgets/global_button.dart';

class DoctorRegisterButton extends StatelessWidget {
  const DoctorRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalButton(
      buttonName: 'Qeydiyyat',
      buttonColor: Color(0xffFDECF2),
      textColor: ColorConstants.primaryRedColor,
      onPressed: () {
        context.push('/doctor_register');
      },
    );
  }
}
