import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../cubits/main/main_state.dart';
import '../../../cubits/main/mainn_cubit.dart';
import '../../../utils/constants/color_constants.dart';
import '../../../utils/extensions/num_extensions.dart';
import '../global_text.dart';

class BottomNavbarItem extends StatelessWidget {
  const BottomNavbarItem({
    super.key,
    required this.i,
    required this.navigationShell,
  });

  final int i;
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return GestureDetector(
      onTap: () {
        mainCubit.changeView(i);
        navigationShell.goBranch(i);
      },
      child: BlocBuilder<MainnCubit, MainInitial>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                SvgPicture.asset(
                  mainCubit.navbarItems[i].icon,
                  colorFilter: ColorFilter.mode(
                    state.indexOfView == i
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
                  color: state.indexOfView == i
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

 // if (i == 0) {
        //   context.go('/home');
        // } else if (i == 1) {
        //   context.go('/daily_advices');
        // } else if (i == 2) {
        //   context.go('/forum_page');
        // } else if (i == 3) {
        //   context.go('/profile_page');
        // }