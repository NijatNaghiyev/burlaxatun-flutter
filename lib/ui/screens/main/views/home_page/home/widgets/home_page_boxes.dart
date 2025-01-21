import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../cubits/main/mainn_cubit.dart';
import 'home_box.dart';

class HomePageBoxes extends StatelessWidget {
  const HomePageBoxes({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: mainCubit.boxItems.length,
      itemBuilder: (_, i) {
        return HomeBox(
          boxName: mainCubit.boxItems[i].boxName,
          boxIcon: 'assets/icons/email_icon.svg',
          onTap: () {
            log('${mainCubit.boxItems[i].route}');
            // mainCubit.changeHomeView(mainCubit.boxItems[i].boxName);
            context.push(mainCubit.boxItems[i].route);
          },
        );
      },
    );
  }
}
