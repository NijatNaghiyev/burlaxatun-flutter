import 'dart:developer';

import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../cubits/questions_cubit/questions_cubit.dart';
import '../../../../../../../../cubits/questions_cubit/questions_state.dart';
import '../../../../../../../../utils/constants/color_constants.dart';

class Ivf extends StatelessWidget {
  const Ivf({super.key});

  @override
  Widget build(BuildContext context) {
    final questionCubit = context.read<QuestionsCubit>();
    return BlocSelector<QuestionsCubit, QuestionsInitial, String>(
      selector: (state) {
        return state.ultrasoundRadioValue!;
      },
      builder: (BuildContext context, state) {
        log('message');
        return Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Column(
            children: [
              Row(
                children: [
                  Radio(
                    visualDensity: VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    activeColor: ColorConstants.primaryColor,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    toggleable: true,
                    splashRadius: 0,
                    value: 'İVF 3 Gün Transfer günü',
                    groupValue: state,
                    onChanged: (v) {
                      log('first radio');
                      questionCubit.updateRadioValue(v!);
                    },
                  ),
                  SizedBox(width: 17),
                  Text('İVF 3 Gün Transfer günü')
                ],
              ),
              18.h,
              Row(
                children: [
                  Radio(
                    visualDensity: VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    activeColor: ColorConstants.primaryColor,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    toggleable: true,
                    splashRadius: 0,
                    value: 'İVF 5 Gün Transfer günü',
                    groupValue: state,
                    onChanged: (v) {
                      log('second radio');
                      questionCubit.updateRadioValue(v!);
                    },
                  ),
                  SizedBox(width: 17),
                  Text('İVF 5 Gün Transfer günü')
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
