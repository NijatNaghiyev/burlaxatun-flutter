import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:burla_xatun/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constants/color_constants.dart';

class AddChildOrImPregnantButton extends StatelessWidget {
  const AddChildOrImPregnantButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(42)),
          border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12) +
            EdgeInsets.only(left: 23, right: 46),
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: ColorConstants.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: SvgPicture.asset(
                      'assets/icons/add_forum_icon.svg',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12),
            SizedBox(
              width: context.deviceWidth * 0.58,
              child: GlobalText(
                height: 1.4,
                textAlign: TextAlign.left,
                text: 'Hamiləyəm və ya uşaq əlavə edin',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
