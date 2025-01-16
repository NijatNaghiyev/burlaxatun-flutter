import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../cubits/questions_cubit/questions_cubit.dart';
import '../../../../../../../data/models/local/calculation_options_model.dart';
import 'single_option.dart';

class CalculationOptions extends StatelessWidget {
  const CalculationOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final questionsCubit = context.read<QuestionsCubit>();
    return SizedBox(
      width: double.maxFinite,
      height: 280,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(36)),
          border: Border.all(color: Colors.black38),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            spacing: 12,
            children: [
              for (int i = 0; i < 4; i++)
                GestureDetector(
                  onTap: () {
                    log('$i');
                    questionsCubit.selectCalculateOption(i);
                    questionsCubit.updateCalculateOption(
                        CalculationOptionsModel.options[i].optionName);
                  },
                  child: BlocBuilder<QuestionsCubit, QuestionsState>(
                    builder: (context, state) {
                      return SingleOption(
                        optionName:
                            CalculationOptionsModel.options[i].optionName,
                        isSelectedOption:
                            questionsCubit.selectedOptionIndex == i,
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
