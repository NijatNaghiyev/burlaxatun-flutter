import 'package:flutter/material.dart';

import 'global_text.dart';

class GlobalAppbar extends StatelessWidget implements PreferredSizeWidget {
  const GlobalAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: 40),
      child: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xff344054),
          ),
        ),
        title: GlobalText(
          text: 'Qeydiyyat',
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Color(0xff344054),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, kToolbarHeight);
}
