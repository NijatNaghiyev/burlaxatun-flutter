import 'package:burla_xatun/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/asset_constants.dart';
import '../../../../widgets/global_input.dart';

class SignupInputs extends StatelessWidget {
  const SignupInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.deviceHeight < 740 ? 13 : 26,
      children: [
        GlobalInput(
          inputName: 'Ad, soyad və ata adı qeyd edin',
          prefixIcon: AssetConstants.userIcon,
          hintText: 'Adınızı qeyd edin',
        ),
        GlobalInput(
          inputName: 'Email',
          prefixIcon: AssetConstants.emailIcon,
          hintText: 'Email qeyd edin',
        ),
        GlobalInput(
          inputName: 'Şifrə',
          prefixIcon: AssetConstants.lockIcon,
          hintText: 'Şifrənizi qeyd edin',
        ),
      ],
    );
  }
}
