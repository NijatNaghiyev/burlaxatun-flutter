import 'dart:developer';

import 'package:burla_xatun/cubits/baby_names_cubit/baby_names_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../utils/constants/color_constants.dart';

class GirlNames extends StatelessWidget {
  const GirlNames({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BabyNamesCubit, BabyNamesState>(
      builder: (context, state) {
        if (state is BabyNamesLoading) {
          log('GIRL PAGE LOADING');
          return CircularProgressIndicator.adaptive();
        } else if (state is BabyNamesSuccess) {
          log('GIRL PAGE SUCCESS');
          return Expanded(
            child: ListView.separated(
              itemCount: state.names?.girls.length ?? 1,
              itemBuilder: (_, i) {
                return ListTile(
                  title: Text(state.names!.girls[i].name),
                  trailing: SvgPicture.asset(
                    'assets/icons/favorite_icon.svg',
                    colorFilter: ColorFilter.mode(
                      state.names!.girls[i].selected == 1
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
          log('GIRL PAGE ERROR');
          return Text('melumat tapilmadi');
        }
        log('GIRL PAGE INITIAL');
        return SizedBox.shrink();
      },
    );
  }
}
