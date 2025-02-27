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
    return BlocBuilder<BabyNamesCubit, BabyNamesState>(
      builder: (context, state) {
        if (state is BabyNamesLoading) {
          log('BOY PAGE LOADING');
          return CircularProgressIndicator.adaptive();
        } else if (state is BabyNamesSuccess) {
          log('BOY PAGE SUCCESS');
          return Expanded(
            child: ListView.separated(
              itemCount: state.names?.boys.length ?? 1,
              itemBuilder: (_, i) {
                return ListTile(
                  title: Text(state.names!.boys[i].name),
                  trailing: SvgPicture.asset(
                    'assets/icons/favorite_icon.svg',
                    colorFilter: ColorFilter.mode(
                      state.names!.boys[i].selected == 1
                          ? ColorConstants.primaryColor
                          : ColorConstants.hintTextColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  onTap: () {},
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Color(0xffDADADA),
                );
              },
            ),
          );
        } else if (state is BabyNamesError) {
          log('BOY PAGE ERROR');
          return Text('melumat tapilmadi');
        }
        log('BOY PAGE INITIAL');
        return SizedBox.shrink();
      },
    );
  }
}
