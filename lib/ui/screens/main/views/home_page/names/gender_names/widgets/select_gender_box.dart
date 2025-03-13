import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../cubits/main_cubit/main_state.dart';
import '../../../../../../../../cubits/main_cubit/mainn_cubit.dart';
import '../../widgets/select_option.dart';
import '../../widgets/single_option.dart';

class SelectGenderBox extends StatelessWidget {
  const SelectGenderBox({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return SelectOption(
      optionOne: BlocBuilder<MainnCubit, MainInitial>(
        buildWhen: (previous, current) {
          return previous.genderOption != current.genderOption;
        },
        builder: (context, state) {
          return SingleOption(
            boxTitle: 'Oglan',
            boxColors: state.genderOption == GenderOption.boy
                ? Colors.white
                : Colors.transparent,
            onTap: () {
              mainCubit.changeGender(GenderOption.boy);
            },
          );
        },
      ),
      optionTwo: BlocBuilder<MainnCubit, MainInitial>(
        buildWhen: (previous, current) {
          return previous.genderOption != current.genderOption;
        },
        builder: (context, state) {
          return SingleOption(
            boxTitle: 'Qiz',
            boxColors: state.genderOption == GenderOption.girl
                ? Colors.white
                : Colors.transparent,
            onTap: () {
              mainCubit.changeGender(GenderOption.girl);
            },
          );
        },
      ),
    );
  }
}
