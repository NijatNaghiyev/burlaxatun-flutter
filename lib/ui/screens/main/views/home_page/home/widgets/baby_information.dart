import 'package:burla_xatun/ui/screens/main/views/home_page/home/widgets/baby_info_box.dart';
import 'package:burla_xatun/ui/screens/main/views/home_page/home/widgets/more_details_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_text.dart';

class BabyInformation extends StatelessWidget {
  const BabyInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: [
            26.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GlobalText(
                  textAlign: TextAlign.left,
                  text: 'Your baby is the size of an apple',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff8C8A8A),
                ),
              ],
            ),
            38.h,
            SvgPicture.asset('assets/svgs/baby_size.svg'),
            40.h,
            Row(
              spacing: 17,
              children: [
                for (int i = 0; i < 3; i++) BabyInfoBox(),
              ],
            ),
            38.h,
            MoreDetailsButton(),
            24.h,
          ],
        ),
      ),
    );
  }
}
