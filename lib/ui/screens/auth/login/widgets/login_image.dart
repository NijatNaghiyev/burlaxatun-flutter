import 'package:burla_xatun/utils/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetConstants.onboard1,
      height: 80,
    );
  }
}
