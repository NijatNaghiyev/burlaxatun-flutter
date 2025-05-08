import 'package:burla_xatun/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final bool? isWhite;

  const CustomCircularProgressIndicator({
    super.key,
    this.isWhite,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 20,
      child: CircularProgressIndicator(
        color: isWhite == false ? Color(0xFFEC407A) : ColorConstants.white,
      ),
    );
  }
}
