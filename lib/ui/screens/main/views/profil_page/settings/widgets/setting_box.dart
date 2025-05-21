import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../widgets/global_text.dart';

class SettingBox extends StatelessWidget {
  const SettingBox({
    super.key,
    required this.onTap,
    required this.boxIcon,
    required this.boxName,
    required this.rightWidget,
  });

  final void Function() onTap;
  final String boxIcon;
  final String boxName;
  final Widget rightWidget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 56,
        width: MediaQuery.of(context).size.width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                SvgPicture.asset(boxIcon),
                SizedBox(width: 21),
                GlobalText(
                  text: boxName,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                Spacer(),
                rightWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
