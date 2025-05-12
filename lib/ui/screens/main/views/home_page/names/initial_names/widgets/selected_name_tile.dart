import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../cubits/baby_names_cubit/baby_names_cubit.dart';
import '../../../../../../../../utils/constants/color_constants.dart';

class SelectedNameTile extends StatelessWidget {
  const SelectedNameTile({
    super.key,
    required this.name,
    required this.nameId,
    required this.tileIndex,
  });

  final String name;
  final String nameId;
  final int tileIndex;

  @override
  Widget build(BuildContext context) {
    final babyNamesCubit = context.read<BabyNamesCubit>();
    return ListTile(
      title: Text(name),
      trailing: BlocConsumer<BabyNamesCubit, BabyNamesInitial>(
        buildWhen: (previous, current) =>
            previous.selectedNameIndex != current.selectedNameIndex,
        listener: (context, state) {
          if (state.nameStateStatus == NameStateStatus.error) {
            log('ERROR WHILE UNSELECTING NAME');
          }
        },
        builder: (context, state) {
          log('Building tile: $tileIndex');
          return GestureDetector(
            onTap: () async {
              babyNamesCubit.updateSelectedNameIndex(tileIndex);
              await babyNamesCubit.selectName(nameId: nameId);
              babyNamesCubit.updateSelectedNameIndex(-1);
            },
            child: SvgPicture.asset(
              'assets/icons/favorite_icon.svg',
              colorFilter: ColorFilter.mode(
                tileIndex == state.selectedNameIndex
                    ? ColorConstants.hintTextColor
                    : ColorConstants.primaryRedColor,
                BlendMode.srcIn,
              ),
            ),
          );
        },
      ),
    );
  }
}
