import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../widgets/global_text.dart';

class NewForumAppbar extends StatelessWidget implements PreferredSizeWidget {
  const NewForumAppbar({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: 32),
      child: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: onTap,
            child: Icon(
              Icons.close_rounded,
              size: 34,
              color: Color(0xff344054),
            ),
          ),
        ),
        title: GlobalText(
          text: 'Yeni Forum',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xff344054),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 22),
            child: SvgPicture.asset('assets/icons/forum_send_icon.svg'),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 70);
}
