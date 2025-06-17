import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_text.dart';
import 'baby_info_box.dart';
import 'more_details_button.dart';

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
                  text: 'Körpəniz alma ölçüsündədir',
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
              mainAxisAlignment: MainAxisAlignment.center,
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
