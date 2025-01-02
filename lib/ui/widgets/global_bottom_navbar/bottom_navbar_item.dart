import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../cubits/main/main_cubit.dart';
import '../../../utils/constants/color_constants.dart';
import '../../../utils/extensions/num_extensions.dart';
import '../global_text.dart';

class BottomNavbarItem extends StatelessWidget {
  const BottomNavbarItem({
    super.key,
    required this.i,
  });

  final int i;

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainCubit>();
    return GestureDetector(
      onTap: () {
        mainCubit.changeView(i);
      },
      child: BlocBuilder<MainCubit, int>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                SvgPicture.asset(
                  mainCubit.navbarItems[i].icon,
                  colorFilter: ColorFilter.mode(
                    mainCubit.indexOfView == i
                        ? ColorConstants.primaryColor
                        : Color(0xff667085),
                    BlendMode.srcIn,
                  ),
                ),
                5.h,
                GlobalText(
                  text: mainCubit.navbarItems[i].iconTitle,
                  fontSize: 12,
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                  color: mainCubit.indexOfView == i
                      ? ColorConstants.primaryColor
                      : Color(0xff667085),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
