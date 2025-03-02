import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../cubits/baby_names_cubit/baby_names_cubit.dart';
import '../../../../../../../../data/models/remote/response/names_model.dart';
import '../../../../../../../../utils/constants/color_constants.dart';

class BoyNameTile extends StatelessWidget {
  const BoyNameTile({
    super.key,
    required this.boyName,
    required this.countryId,
  });

  final Gender boyName;
  final String countryId;

  @override
  Widget build(BuildContext context) {
    final babyNamesCubit = context.read<BabyNamesCubit>();
    return ListTile(
      title: Text(boyName.name),
      trailing: BlocBuilder<BabyNamesCubit, BabyNamesInitial>(
        // buildWhen: (previous, current) {
        //   return previous.names !=
        //       current.names; // amma heart icon gec rengini deyisir
        // },
        builder: (context, state) {
          if (state.nameStateStatus == NameStateStatus.loading) {
            log('HEART STATUS ${state.nameStateStatus}');
            return SvgPicture.asset(
              'assets/icons/favorite_icon.svg',
              colorFilter: ColorFilter.mode(
                boyName.selected == 1
                    ? ColorConstants.hintTextColor
                    : ColorConstants.primaryColor,
                BlendMode.srcIn,
              ),
            );
          } else
          if (state.nameStateStatus == NameStateStatus.success) {
            log('HEART STATUS ${state.nameStateStatus}');
            return GestureDetector(
              onTap: () async {
                await babyNamesCubit.selectName(boyName.id);
                await babyNamesCubit.getNames(countryId);
              },
              child: SvgPicture.asset(
                'assets/icons/favorite_icon.svg',
                colorFilter: ColorFilter.mode(
                  boyName.selected == 1
                      ? ColorConstants.primaryColor
                      : ColorConstants.hintTextColor,
                  BlendMode.srcIn,
                ),
              ),
            );
          } else if (state.nameStateStatus == NameStateStatus.error) {
            log('HEART STATUS ${state.nameStateStatus}');
            log('error');
          }
          log('HEART STATUS ${state.nameStateStatus}');
          return SizedBox.shrink();
        },
      ),
    );
  }
}
