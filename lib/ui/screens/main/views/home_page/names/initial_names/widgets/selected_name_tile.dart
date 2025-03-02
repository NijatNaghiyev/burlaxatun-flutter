import 'dart:developer';

import 'package:burla_xatun/cubits/baby_names_cubit/baby_names_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../utils/constants/color_constants.dart';

class SelectedNameTile extends StatelessWidget {
  const SelectedNameTile({
    super.key,
    required this.name,
    required this.nameId,
  });

  final String name;
  final String nameId;

  @override
  Widget build(BuildContext context) {
    final babyNamesCubit = context.read<BabyNamesCubit>();
    return ListTile(
      title: Text(name),
      trailing: BlocConsumer<BabyNamesCubit, BabyNamesInitial>(
        buildWhen: (previous, current) {
          return previous.selectedNames != current.selectedNames;
        },
        listener: (context, state) {
          if (state.nameStateStatus == NameStateStatus.error) {
            log('ERROR WHILE UNSELECTING NAME');
          }
        },
        builder: (context, state) {
          if (state.nameStateStatus == NameStateStatus.loading) {
            SvgPicture.asset(
              'assets/icons/favorite_icon.svg',
              colorFilter: ColorFilter.mode(
                Colors.blue,
                BlendMode.srcIn,
              ),
            );
          } else if (state.nameStateStatus == NameStateStatus.success) {
            return GestureDetector(
              onTap: () async {
                await babyNamesCubit.selectName(nameId);
                await babyNamesCubit.updateSelectedNames();
              },
              child: SvgPicture.asset(
                'assets/icons/favorite_icon.svg',
                colorFilter: ColorFilter.mode(
                  ColorConstants.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
            );
          }
          log('STATE STATUS: ${state.nameStateStatus}');
          return SvgPicture.asset(
            'assets/icons/favorite_icon.svg',
            colorFilter: ColorFilter.mode(
              ColorConstants.primaryColor,
              BlendMode.srcIn,
            ),
          );
        },
      ),
    );
  }
}
