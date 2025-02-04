import 'package:flutter/material.dart';

import 'global_text.dart';

class GlobalAppbar extends StatelessWidget implements PreferredSizeWidget {
  const GlobalAppbar({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: 32),
      child: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: onTap,
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xff344054),
          ),
        ),
        title: GlobalText(
          text: title,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Color(0xff344054),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 70);
}
