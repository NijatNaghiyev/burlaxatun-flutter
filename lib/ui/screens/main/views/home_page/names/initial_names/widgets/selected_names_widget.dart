import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../cubits/baby_names_cubit/baby_names_cubit.dart';
import 'selected_name_tile.dart';

class SelectedNamesWidget extends StatelessWidget {
  const SelectedNamesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BabyNamesCubit, BabyNamesInitial>(
      builder: (context, state) {
        if (state.nameStateStatus == NameStateStatus.loading) {
          return CircularProgressIndicator.adaptive();
        } else if (state.nameStateStatus == NameStateStatus.success) {
          final nameList = state.selectedNames;
          return Expanded(
            child: ListView.separated(
              itemCount: nameList!.length,
              itemBuilder: (_, i) {
                return SelectedNameTile(name: nameList[i].name);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Color(0xffDADADA),
                );
              },
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
