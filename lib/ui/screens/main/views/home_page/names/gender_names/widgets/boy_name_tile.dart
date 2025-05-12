import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../cubits/baby_names_cubit/baby_names_cubit.dart';
import '../../../../../../../../data/models/remote/response/names_model.dart';
import '../../../../../../../../utils/constants/color_constants.dart';

class BoyNameTile extends StatefulWidget {
  const BoyNameTile({
    super.key,
    required this.boyName,
    required this.countryId,
  });

  final Gender boyName;
  final String countryId;

  @override
  State<BoyNameTile> createState() => _BoyNameTileState();
}

class _BoyNameTileState extends State<BoyNameTile> {
  late final BabyNamesCubit babyNamesCubit;
  @override
  void initState() {
    babyNamesCubit = context.read<BabyNamesCubit>();
    // if (babyNamesCubit.state.isSelected == -1) {
    babyNamesCubit.changeIsSelected(v: widget.boyName.selected);
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('tile builded');
    final BabyNamesCubit babyNamesCubit = context.read<BabyNamesCubit>();
    // isNameSelected.value = boyName.selected == 1;
    return ListTile(
      title: Text(widget.boyName.name),
      trailing: BlocBuilder<BabyNamesCubit, BabyNamesInitial>(
        buildWhen: (previous, current) {
          return previous.isSelected != current.isSelected;
          //  ||
          // previous.names != current.names;
        },
        builder: (context, state) {
          if (state.selectNameStatus == SelectNameStatus.error) {
            log('error');
          }
          log('HEART STATUS ${state.nameStateStatus}');
          return GestureDetector(
            onTap: () async {
              babyNamesCubit.changeIsSelected(
                  v: widget.boyName.selected == 1 ? 0 : 1);
              await babyNamesCubit.selectName(
                  nameId: widget.boyName.id, countryId: widget.countryId);
              // await babyNamesCubit.getNames(countryId);
            },
            child: SvgPicture.asset(
              'assets/icons/favorite_icon.svg',
              colorFilter: ColorFilter.mode(
                state.isSelected == 1
                    ? ColorConstants.primaryRedColor
                    : ColorConstants.hintTextColor,
                BlendMode.srcIn,
              ),
            ),
          );
        },
      ),
    );
  }
}

// trailing: GestureDetector(
//   onTap: () async {
//     isNameSelected.value = !isNameSelected.value;
//     await babyNamesCubit.selectName(boyName.id);
//     // await babyNamesCubit.getNames(countryId);
//   },
//   child: ValueListenableBuilder(
//     valueListenable: isNameSelected,
//     builder: (context, isSelected, child) {
//       return SvgPicture.asset(
//         'assets/icons/favorite_icon.svg',
//         colorFilter: ColorFilter.mode(
//           isSelected
//               ? ColorConstants.primaryColor
//               : ColorConstants.hintTextColor,
//           BlendMode.srcIn,
//         ),
//       );
//     },
//   ),
// ),
