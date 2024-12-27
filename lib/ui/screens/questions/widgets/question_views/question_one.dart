import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/questions_cubit/questions_cubit.dart';
import '../../../../../data/models/local/question_one_options_model.dart';
import '../../../../../utils/constants/color_constants.dart';
import '../../../../../utils/constants/padding_constants.dart';
import '../../../../../utils/extensions/num_extensions.dart';
import '../../../../widgets/global_text.dart';
import 'question_one_buttons.dart';

class QuestionOne extends StatelessWidget {
  const QuestionOne({super.key});

  @override
  Widget build(BuildContext context) {
    final questionsCubit = context.read<QuestionsCubit>();
    return Padding(
      padding: PaddingConstants.h20,
      child: Column(
        children: [
          GlobalText(
            text: 'Siz hamiləsiniz?',
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          59.h,
          for (int i = 0; i < 3; i++)
            BlocBuilder<QuestionsCubit, QuestionsState>(
              builder: (context, state) {
                log('build getdi figer yerde');
                if (state is QuestionsInitial) {
                  return QuestionOneButton(
                    buttonName: QuestionOneOptionsModel.options[i].option,
                    onPressed: () {
                      log('$i');
                      questionsCubit.selectOption(i);
                    },
                    buttonColor:
                        state.currentIndex != null && i == state.currentIndex!
                            ? Color(0xffFFD3E2)
                            : Colors.white,
                    borderColor:
                        state.currentIndex != null && i == state.currentIndex!
                            ? Colors.transparent
                            : ColorConstants.primaryColor,
                  );
                }
                return SizedBox.shrink();
              },
            )
        ],
      ),
    );
  }
}
