import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/questions_cubit/questions_cubit.dart';
import '../../../../../utils/constants/color_constants.dart';
import '../../../../widgets/global_button.dart';

class QuestionOneButton extends StatelessWidget {
  const QuestionOneButton({
    super.key,
    required this.buttonName,
    required this.optionIndex,
  });

  final String buttonName;
  final int optionIndex;

  @override
  Widget build(BuildContext context) {
    final questionsCubit = context.read<QuestionsCubit>();
    return RepaintBoundary(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: ValueListenableBuilder(
          valueListenable: questionsCubit.questionOneButtonNotifier,
          builder: (context, value, child) {
            bool isSelected = optionIndex == value;
            log('index $value builded');
            return GlobalButton(
              buttonName: buttonName,
              buttonColor: isSelected ? Color(0xffFFD3E2) : Colors.white,
              borderColor:
                  isSelected ? Colors.transparent : ColorConstants.primaryColor,
              textColor: ColorConstants.primaryColor,
              onPressed: () {
                questionsCubit.questionOneButtonNotifier.value = optionIndex;
                questionsCubit.updateIsActiveButton();
              },
            );
          },
        ),
      ),
    );
  }
}



      // BlocBuilder<QuestionsCubit, QuestionsInitial>(
      //   builder: (context, state) {
      //     log('selected optionIndex: $optionIndex');
      //     log('current: ${state.currentQuestionOneOptionIndex}');
      //     return GlobalButton(
      //       buttonName: buttonName,
      //       buttonColor: optionIndex == state.currentQuestionOneOptionIndex
      //           ? Color(0xffFFD3E2)
      //           : Colors.white,
      //       borderColor: optionIndex == state.currentQuestionOneOptionIndex
      //           ? Colors.transparent
      //           : ColorConstants.primaryColor,
      //       textColor: ColorConstants.primaryColor,
      //       onPressed: () {
      //         questionsCubit.updateCurrentQuestionOneOption(optionIndex);
      //         questionsCubit.updateIsActiveButton(v: optionIndex);
      //       },
      //     );
      //   },
      // ),