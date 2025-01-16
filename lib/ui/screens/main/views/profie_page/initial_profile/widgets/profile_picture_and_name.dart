import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePictureAndName extends StatelessWidget {
  const ProfilePictureAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GlobalText(
          text: 'My Profile',
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        16.h,
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Image.asset(
              'assets/png/pfp.png',
              width: 94,
              height: 94,
            ),
            Positioned(
              child: SizedBox(
                height: 28,
                width: 28,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffEC407A),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: SvgPicture.asset('assets/icons/camera_icon.svg'),
                  ),
                ),
              ),
            )
          ],
        ),
        16.h,
        GlobalText(
          text: 'Aysel Aliyeva',
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ],
    );
  }
}
