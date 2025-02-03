import '../../../../../../../cubits/main/main_state.dart';
import 'widgets/boy_names.dart';
import 'widgets/girl_names.dart';
import 'widgets/select_gender_box.dart';
import '../../../../../../../utils/constants/padding_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../cubits/main/mainn_cubit.dart';
import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_appbar.dart';

class GenderNames extends StatelessWidget {
  const GenderNames({super.key});

  @override
  Widget build(BuildContext context) {
    // final mainCubit = context.read<MainnCubit>();
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Adlar',
        onTap: () {
          context.pop();
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
                builder: (context, state) {
                  return state.genderOption == GenderOption.boy
                      ? BoyNames()
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
