import 'package:flutter/material.dart';

import '../../../../../utils/constants/asset_constants.dart';
import '../../widgets/auth_text_field.dart';

class SignupInputs extends StatelessWidget {
  const SignupInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 26,
      children: [
        AuthTextField(
          inputName: 'Ad, soyad və ata adı qeyd edin',
          prefixIcon: AssetConstants.userIcon,
          hintText: 'Adınızı qeyd edin',
        ),
        AuthTextField(
          inputName: 'Email',
          prefixIcon: AssetConstants.emailIcon,
          hintText: 'Email qeyd edin',
        ),
        AuthTextField(
          inputName: 'Şifrə',
          prefixIcon: AssetConstants.lockIcon,
          hintText: 'Şifrənizi qeyd edin',
        ),
      ],
    );
  }
}
