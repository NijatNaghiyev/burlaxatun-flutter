import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../utils/extensions/num_extensions.dart';

class HomeBox extends StatelessWidget {
  const HomeBox({
    super.key,
    required this.boxName,
    required this.boxIcon,
    required this.onTap,
  });

  final String boxName;
  final String boxIcon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 123,
        width: MediaQuery.of(context).size.width * 0.43,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(boxIcon),
              10.h,
              SizedBox(
                width: 137,
                child: GlobalText(
                  height: 1.2,
                  text: boxName,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
