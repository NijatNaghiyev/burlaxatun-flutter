import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../cubits/baby_names_cubit/baby_names_cubit.dart';
import 'boy_name_tile.dart';

class BoyNames extends StatelessWidget {
  const BoyNames({
    super.key,
    required this.countryId,
  });

  final String countryId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BabyNamesCubit, BabyNamesInitial>(
      buildWhen: (previous, current) =>
          previous.names != current.names ||
          previous.nameStateStatus != current.nameStateStatus,
      builder: (context, state) {
        log('BUILDED');
        if (state.nameStateStatus == NameStateStatus.loading) {
          log('BOY PAGE STATUS ${state.nameStateStatus}');
          return CircularProgressIndicator.adaptive();
        } else if (state.nameStateStatus == NameStateStatus.success) {
          log('BOY PAGE STATUS ${state.nameStateStatus}');
          return Expanded(
            child: ListView.separated(
              itemCount: state.names!.boys.length,
              itemBuilder: (_, i) {
                final boyName = state.names!.boys[i];
                return BoyNameTile(boyName: boyName, countryId: countryId);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Color(0xffDADADA),
                );
              },
            ),
          );
        } else if (state.nameStateStatus == NameStateStatus.error) {
          log('BOY PAGE STATUS ${state.nameStateStatus}');
          return Text('melumat tapilmadi');
        }
        log('BOY PAGE STATUS ${state.nameStateStatus}');
        return SizedBox.shrink();
      },
    );
  }
}
