import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../cubits/baby_names_cubit/baby_names_cubit.dart';
import 'selected_name_tile.dart';

class SelectedNamesWidget extends StatelessWidget {
  const SelectedNamesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final babyNamesCubit = context.read<BabyNamesCubit>();
    return BlocBuilder<BabyNamesCubit, BabyNamesInitial>(
      // buildWhen: (previous, current) {
      // return previous.selectedNames != current.selectedNames; // successe girmir
      // },
      builder: (context, state) {
        if (state.nameStateStatus == NameStateStatus.loading) {
          // return CircularProgressIndicator.adaptive();
          final nameList = state.selectedNames;
          return Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await babyNamesCubit.updateSelectedNames();
              },
              child: ListView.separated(
                itemCount: nameList!.length,
                itemBuilder: (_, i) {
                  return SelectedNameTile(
                    name: nameList[i].name,
                    nameId: nameList[i].id,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Color(0xffDADADA),
                  );
                },
              ),
            ),
          );
        } else if (state.nameStateStatus == NameStateStatus.success ||
            state.nameStateStatus == NameStateStatus.loading) {
          final nameList = state.selectedNames;
          return Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await babyNamesCubit.updateSelectedNames();
              },
              child: ListView.separated(
                itemCount: nameList!.length,
                itemBuilder: (_, i) {
                  return SelectedNameTile(
                    name: nameList[i].name,
                    nameId: nameList[i].id,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Color(0xffDADADA),
                  );
                },
              ),
            ),
          );
        } else if (state.nameStateStatus == NameStateStatus.error) {
          return Text('Beyenilen adlar tapilmadi');
        }
        return SizedBox.shrink();
      },
    );
  }
}
