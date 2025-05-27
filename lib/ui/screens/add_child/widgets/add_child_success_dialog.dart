import 'dart:math' as math;

import 'package:burla_xatun/ui/screens/questions/widgets/calculate_birth_view/widgets/apple_circle.dart';
import 'package:burla_xatun/ui/widgets/global_button.dart';
import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:burla_xatun/utils/constants/asset_constants.dart';
import 'package:burla_xatun/utils/constants/color_constants.dart';
import 'package:burla_xatun/utils/constants/padding_constants.dart';
import 'package:burla_xatun/utils/extensions/context_extensions.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AddChildSuccessDialog extends StatelessWidget {
  const AddChildSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.deviceWidth * 0.78,
        height: context.deviceHeight * 0.5,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(38)),
          ),
          child: Padding(
            padding: PaddingConstants.v20 + PaddingConstants.h15,
            child: Column(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AssetConstants.successImage,
                      )
                    ],
                  ),
                ),
                (context.deviceHeight * 0.04).h,
                GlobalText(
                  text: 'Övladınız uğurla əlavə olundu',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                ),
                22.h,
                GlobalButton(
                  buttonName: 'Ana səhifə',
                  textFSize: 14,
                  textHeight: 0,
                  buttonColor: Color(0xffFDECF2),
                  textColor: ColorConstants.primaryRedColor,
                  height: 44,
                  onPressed: () {
                    context.go('/home');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
