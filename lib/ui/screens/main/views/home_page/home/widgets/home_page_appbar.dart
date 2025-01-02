import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../widgets/global_text.dart';

class HomePageAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 20) + EdgeInsets.only(top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GlobalText(
                    text: 'Hello Ali',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff8C8A8A),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/notification_bing.svg'),
                  SizedBox(width: 25),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child:
                        SvgPicture.asset('assets/icons/side_navbar_icon.svg'),
                  ),
                ],
              ),
            ],
          ),
          GlobalText(
            textAlign: TextAlign.left,
            height: 1.3,
            text: '6th Week of Pregnancy \nDay 20',
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 101);
}
