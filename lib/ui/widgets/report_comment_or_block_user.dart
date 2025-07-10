import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/extensions/context_extensions.dart';

class ReportCommentOrBlockUser extends StatelessWidget {
  const ReportCommentOrBlockUser({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceHeight * 0.2,
      width: context.deviceWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            12.h,
            Center(
              child: Container(
                height: 5,
                width: 52,
                decoration: BoxDecoration(
                  color: Color(0xff252B37),
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
              ),
            ),
            6.h,
            GlobalText(
              text: 'Rəy',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff414651),
            ),
            24.h,
            Row(
              children: [
                SvgPicture.asset('assets/svgs/report_icon.svg'),
                SizedBox(width: 8),
                GlobalText(
                  text: 'Hesabat',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff252B37),
                ),
              ],
            ),
            12.h,
            Row(
              children: [
                SvgPicture.asset('assets/svgs/block_user_icon.svg'),
                SizedBox(width: 8),
                GlobalText(
                  text: 'İstifadəçini bloklayın',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff252B37),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
