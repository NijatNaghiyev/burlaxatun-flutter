import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../cubits/baby_names_cubit/baby_names_cubit.dart';
import '../../../../../../../../utils/constants/color_constants.dart';

class BoyNames extends StatelessWidget {
  const BoyNames({super.key});

  @override
  Widget build(BuildContext context) {
    final babyNamesCubit = context.read<BabyNamesCubit>();
    return BlocBuilder<BabyNamesCubit, BabyNamesInitial>(
      builder: (context, state) {
        if (state.nameStateStatus == NameStateStatus.loading) {
          log('BOY PAGE LOADING');
          return CircularProgressIndicator.adaptive();
        } else if (state.nameStateStatus == NameStateStatus.success) {
          log('BOY PAGE SUCCESS');
          return Expanded(
            child: ListView.separated(
              itemCount: state.names!.boys.length,
              itemBuilder: (_, i) {
                final boyName = state.names!.boys[i];
                return ListTile(
                  title: Text(boyName.name),
                  trailing: BlocBuilder<BabyNamesCubit, BabyNamesInitial>(
                    builder: (context, state) {
                      if (state.nameStateStatus == NameStateStatus.loading) {
                        return CircularProgressIndicator.adaptive();
                      } else if (state.nameStateStatus ==
                          NameStateStatus.success) {
                        return SvgPicture.asset(
                          'assets/icons/favorite_icon.svg',
                          colorFilter: ColorFilter.mode(
                            boyName.selected == 1
                                ? ColorConstants.primaryColor
                                : ColorConstants.hintTextColor,
                            BlendMode.srcIn,
                          ),
                        );
                      } else if (state.nameStateStatus ==
                          NameStateStatus.error) {
                        log('error');
                      }
                      return SizedBox.shrink();
                    },
                  ),
                  onTap: () {
                    babyNamesCubit.selectName(boyName.id);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Color(0xffDADADA),
                );
              },
            ),
          );
        } else if (state.nameStateStatus == NameStateStatus.error) {
          log('BOY PAGE ERROR');
          return Text('melumat tapilmadi');
        }
        log('BOY PAGE INITIAL');
        return SizedBox.shrink();
      },
    );
  }
}
