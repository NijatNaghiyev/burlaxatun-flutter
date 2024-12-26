import '../../../../../utils/constants/padding_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/color_constants.dart';
import '../../../../../utils/extensions/num_extensions.dart';
import '../../../../widgets/global_button.dart';
import '../../../../widgets/global_text.dart';

class QuestionThree extends StatelessWidget {
  const QuestionThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstants.h20,
      child: Column(
        children: [
          GlobalText(
            text: 'İlk körpənizdi?',
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          60.h,
          GlobalButton(
            buttonName: 'Bəli',
            buttonColor: Colors.white,
            borderColor: ColorConstants.primaryColor,
            textColor: ColorConstants.primaryColor,
            onPressed: () {},
          ),
          14.h,
          GlobalButton(
            buttonName: 'Xeyr',
            buttonColor: Colors.white,
            borderColor: ColorConstants.primaryColor,
            textColor: ColorConstants.primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
