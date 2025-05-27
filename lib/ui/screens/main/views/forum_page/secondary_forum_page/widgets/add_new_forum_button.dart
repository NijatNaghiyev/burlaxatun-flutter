import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../utils/constants/color_constants.dart';

class AddNewForumButton extends StatelessWidget {
  final int categoryId;

  const AddNewForumButton({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/create_new_forum?categoryId=$categoryId');
      },
      child: SizedBox(
        width: 56,
        height: 56,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorConstants.primaryRedColor,
          ),
          child: Center(
            child: SvgPicture.asset('assets/icons/add_forum_icon.svg'),
          ),
        ),
      ),
    );
  }
}
