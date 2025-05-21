import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../cubits/main_cubit/mainn_cubit.dart';
import 'section_box.dart';

class ProfilePageSections extends StatelessWidget {
  const ProfilePageSections({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return Column(
      spacing: 12,
      children: [
        for (int i = 0; i < mainCubit.profileSectionItems.length; i++)
          SectionBox(
            sectionicon: mainCubit.profileSectionItems[i].icon,
            sectionName: mainCubit.profileSectionItems[i].sectionName,
            onTap: () {
              log(mainCubit.profileSectionItems[i].sectionRoute);
              context.push(mainCubit.profileSectionItems[i].sectionRoute);
            },
          ),
      ],
    );
  }
}
