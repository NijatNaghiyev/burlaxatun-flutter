import 'dart:developer';

import 'package:burla_xatun/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinputWidget extends StatelessWidget {
  PinputWidget({super.key});

  final defaultPinTheme = PinTheme(
    width: 77,
    height: 77,
    textStyle: TextStyle(
      fontSize: 32,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xffD8DADC)),
      borderRadius: BorderRadius.circular(15),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Pinput(
      onCompleted: (value) {
        log(value);
      },
      autofocus: true,
      showCursor: false,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyDecorationWith(
        border: Border.all(color: ColorConstants.primaryColor),
      ),
    );
  }
}
