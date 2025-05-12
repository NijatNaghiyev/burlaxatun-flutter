import 'package:burla_xatun/utils/constants/asset_constants.dart';
import 'package:burla_xatun/utils/constants/color_constants.dart';
import 'package:burla_xatun/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class AppleCircle extends StatelessWidget {
  const AppleCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.deviceWidth * 0.27,
      height: context.deviceHeight * 0.12,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: ColorConstants.appleGreen,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Image.asset(AssetConstants.greenApple),
        ),
      ),
    );
  }
}
