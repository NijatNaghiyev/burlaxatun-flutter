import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../cubits/main/mainn_cubit.dart';
import 'bottom_navbar_item.dart';

class GlobalBottomNavbar extends StatelessWidget {
  const GlobalBottomNavbar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return SizedBox(
      width: double.maxFinite,
      height: 84,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Row(
          spacing: 21,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 0; i < mainCubit.views.length; i++)
              BottomNavbarItem(
                i: i,
                navigationShell: navigationShell,
              ),
          ],
        ),
      ),
    );
  }
}
