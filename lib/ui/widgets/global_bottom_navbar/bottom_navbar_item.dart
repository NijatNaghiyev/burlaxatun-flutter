import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../cubits/main_cubit/main_state.dart';
import '../../../cubits/main_cubit/mainn_cubit.dart';
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
      onLongPress: () {
        i == 3 ? mainCubit.showChangeBabyBottomSheet(context) : null;
      },
      child: BlocBuilder<MainnCubit, MainInitial>(
        buildWhen: (previous, current) =>
            previous.indexOfView != current.indexOfView,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                SvgPicture.asset(
                  mainCubit.navbarItems[i].icon,
                  colorFilter: ColorFilter.mode(
                    state.indexOfView == i
                        ? ColorConstants.primaryRedColor
                        : Color(0xff667085),
                    BlendMode.srcIn,
                  ),
                ),
                5.h,
                GlobalText(
                  text: mainCubit.navbarItems[i].iconTitle,
                  fontSize: 12,
                  height: 1.4,
                  fontWeight: FontWeight.w500,
                  color: state.indexOfView == i
                      ? ColorConstants.primaryRedColor
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
