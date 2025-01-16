import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../widgets/global_text.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 56,
        width: MediaQuery.of(context).size.width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Color(0xffFEE4E2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/log_out_icon.svg'),
                SizedBox(width: 21),
                GlobalText(
                  text: 'Çıxış',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffF04438),
                ),
                Spacer(),
                SvgPicture.asset(
                  'assets/icons/log_out_arrow_icon.svg',
                  colorFilter: ColorFilter.mode(Color(0xffF04438), BlendMode.dstIn,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
