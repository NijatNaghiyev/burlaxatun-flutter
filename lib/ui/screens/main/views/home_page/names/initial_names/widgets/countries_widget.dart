import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../cubits/baby_names_cubit/baby_names_cubit.dart';

class CountriesWidget extends StatelessWidget {
  const CountriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final babyNamesCubit = context.read<BabyNamesCubit>();
    return BlocBuilder<BabyNamesCubit, BabyNamesInitial>(
      buildWhen: (previous, current) {
        return previous.countryList != current.countryList;
      },
      builder: (context, state) {
        // log('INITIAL PAGE BUILDED');
        if (state.nameStateStatus == NameStateStatus.error) {
          log('COUNTRY PAGE STATE: ${state.nameStateStatus}');
          return Center(
            child: Text('Melumat tapilmadi'),
          );
        } else if (state.nameStateStatus == NameStateStatus.success) {
          log('COUNTRY PAGE STATE: ${state.nameStateStatus}');
          return Expanded(
            child: ListView.separated(
              itemCount: state.countryList!.length,
              itemBuilder: (_, i) {
                return ListTile(
                  leading: Image.asset(
                    'assets/png/flag.png',
                    width: 46,
                    height: 46,
                  ),
                  title: Text(state.countryList![i].title),
                  trailing: SvgPicture.asset('assets/icons/arrow_right.svg'),
                  onTap: () {
                    context.push('/gender_names', extra: {
                      'id': state.countryList![i].id,
                      'cubit': babyNamesCubit,
                    });
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
        } else if (state.nameStateStatus == NameStateStatus.loading) {
          log('COUNTRY PAGE STATE: ${state.nameStateStatus}');
          return Center(child: CircularProgressIndicator.adaptive());
        }
        log('COUNTRY PAGE STATE: ${state.nameStateStatus}');
        return SizedBox.shrink();
      },
    );
  }
}
