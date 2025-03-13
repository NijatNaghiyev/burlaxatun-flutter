import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../utils/constants/asset_constants.dart';
import '../../../../../../../../../widgets/global_input.dart';

class ResetPasswordInputs extends StatelessWidget {
  const ResetPasswordInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 25,
      children: [
        GlobalInput(
          inputName: 'New password',
          prefixIcon: 'assets/icons/lock_2.svg',
          hintText: 'Yeni şifrəni qeyd edin',
          isObsecure: true,
          suffixIcon: 5 == 5
              ? AssetConstants.eyeSlashedIcon
              : AssetConstants.eyeOpenIcon,
        ),
        GlobalInput(
          inputName: 'Confirm new password',
          prefixIcon: 'assets/icons/lock_2.svg',
          hintText: 'Yeni şifrəni təsdiq edin',
          isObsecure: true,
          suffixIcon: 5 == 5
              ? AssetConstants.eyeSlashedIcon
              : AssetConstants.eyeOpenIcon,
        ),
        5.h,
      ],
    );
  }
}
