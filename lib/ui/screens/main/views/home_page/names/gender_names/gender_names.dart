import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../cubits/baby_names_cubit/baby_names_cubit.dart';
import '../../../../../../../cubits/main_cubit/main_state.dart';
import '../../../../../../../cubits/main_cubit/mainn_cubit.dart';
import '../../../../../../../utils/constants/padding_constants.dart';
import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_appbar.dart';
import 'widgets/boy_names.dart';
import 'widgets/girl_names.dart';
import 'widgets/select_gender_box.dart';

class GenderNames extends StatelessWidget {
  const GenderNames({
    super.key,
    required this.countryId,
  });

  final String countryId;

  @override
  Widget build(BuildContext context) {
    final babyNamesCubit = context.read<BabyNamesCubit>();
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Adlar2',
        onLeadingTap: () {
          context.pop();
          babyNamesCubit.changeIsSelected(v: -1);
        },
      ),
      body: Padding(
        padding: PaddingConstants.h20,
        child: Center(
          child: Column(
            children: [
              14.h,
              SelectGenderBox(),
              24.h,
              BlocBuilder<MainnCubit, MainInitial>(
                buildWhen: (previous, current) =>
                    previous.genderOption != current.genderOption,
                builder: (context, state) {
                  return state.genderOption == GenderOption.boy
                      ? BoyNames(countryId: countryId)
                      : GirlNames();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
