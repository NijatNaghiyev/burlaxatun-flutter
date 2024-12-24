import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../utils/constants/asset_constants.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetConstants.trust,
      width: 129,
      height: 126,
    );
  }
}
