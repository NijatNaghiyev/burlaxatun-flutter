import 'dart:developer';

import 'package:burla_xatun/cubits/questions_cubit/questions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: BlocBuilder<QuestionsCubit, QuestionsState>(
        builder: (context, state) {
          if (state is QuestionsInitial) {
            log('button builded');
            return GlobalButton(
              buttonName: buttonName,
              buttonColor: state.currentIndex != null &&
                      optionIndex == state.currentIndex!
                  ? Color(0xffFFD3E2)
                  : Colors.white,
              borderColor: state.currentIndex != null &&
                      optionIndex == state.currentIndex!
                  ? Colors.transparent
                  : ColorConstants.primaryColor,
              textColor: ColorConstants.primaryColor,
              onPressed: () => questionsCubit.selectOption(optionIndex),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
