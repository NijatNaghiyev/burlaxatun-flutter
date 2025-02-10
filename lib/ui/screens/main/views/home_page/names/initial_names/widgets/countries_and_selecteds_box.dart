import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../cubits/main_cubit/main_state.dart';
import '../../../../../../../../cubits/main_cubit/mainn_cubit.dart';
import '../../widgets/select_option.dart';
import '../../widgets/single_option.dart';

class CountriesAndSelectedsBox extends StatelessWidget {
  const CountriesAndSelectedsBox({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return SelectOption(
      optionOne: BlocBuilder<MainnCubit, MainInitial>(
        buildWhen: (previous, current) {
          return previous.nameViewOptions != current.nameViewOptions;
        },
        builder: (context, state) {
          return SingleOption(
            boxTitle: 'Ölkələr',
            boxColors: state.nameViewOptions == NameViewOption.countries
                ? Colors.white
                : Colors.transparent,
            onTap: () {
              mainCubit.changeNameView(NameViewOption.countries);
            },
          );
        },
      ),
      optionTwo: BlocBuilder<MainnCubit, MainInitial>(
        buildWhen: (previous, current) {
          return previous.nameViewOptions != current.nameViewOptions;
        },
        builder: (context, state) {
          return SingleOption(
            boxTitle: 'Seçilmişlər',
            boxColors: state.nameViewOptions == NameViewOption.selecteds
                ? Colors.white
                : Colors.transparent,
            onTap: () {
              mainCubit.changeNameView(NameViewOption.selecteds);
            },
          );
        },
      ),
    );
  }
}
