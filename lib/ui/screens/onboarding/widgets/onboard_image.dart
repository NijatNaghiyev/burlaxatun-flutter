import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardImage extends StatelessWidget {
  const OnboardImage({
    super.key,
    required this.onboardImage,
  });

  final String onboardImage;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      onboardImage,
    );
  }
}
