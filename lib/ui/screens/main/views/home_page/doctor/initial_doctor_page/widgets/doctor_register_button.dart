import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../utils/constants/color_constants.dart';
import '../../../../../../../widgets/global_button.dart';

class DoctorRegisterButton extends StatelessWidget {
  final String slug;

  const DoctorRegisterButton({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    return GlobalButton(
      buttonName: 'Qeydiyyat',
      buttonColor: const Color(0xffFDECF2),
      textColor: ColorConstants.primaryRedColor,
      onPressed: () {
        context.push('/doctor_register/$slug');
      },
    );
  }
}
