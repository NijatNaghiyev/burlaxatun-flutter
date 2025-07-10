import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../widgets/global_text.dart';

class SectionBox extends StatelessWidget {
  const SectionBox({
    super.key,
    required this.sectionicon,
    required this.sectionName,
    required this.onTap,
  });

  final String sectionicon;
  final String sectionName;
  final void Function() onTap;

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
                SvgPicture.asset(sectionicon),
                SizedBox(width: 21),
                GlobalText(
                  text: sectionName,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                Spacer(),
                SvgPicture.asset('assets/icons/arrow_right.svg')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
