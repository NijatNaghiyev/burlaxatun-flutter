import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/questions_cubit/questions_cubit.dart';
import '../../../../../cubits/questions_cubit/questions_state.dart';
import '../../../../../utils/constants/color_constants.dart';
import '../../../../../utils/constants/padding_constants.dart';
import '../../../../../utils/extensions/num_extensions.dart';
import '../../../../widgets/global_button.dart';
import '../../../../widgets/global_text.dart';

class QuestionThree extends StatelessWidget {
  const QuestionThree({super.key});

  @override
  Widget build(BuildContext context) {
    final questionCubit = context.read<QuestionsCubit>();
    return Padding(
      padding: PaddingConstants.h20 + EdgeInsets.only(top: 56),
      child: Column(
        children: [
          GlobalText(
            text: 'İlk körpənizdi?',
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          60.h,
          BlocBuilder<QuestionsCubit, QuestionsInitial>(
            builder: (context, state) {
              return GlobalButton(
                buttonName: 'Bəli',
                buttonColor: state.isFirstChild == null
                    ? Colors.white
                    : state.isFirstChild!
                        ? Color(0xffFFD3E2)
                        : Colors.white,
                borderColor: ColorConstants.primaryColor,
                textColor: ColorConstants.primaryColor,
                onPressed: () {
                  questionCubit.updateQuestionThreeAnswer(true);
                  questionCubit.updateIsActiveButton();
                },
              );
            },
          ),
          14.h,
          BlocBuilder<QuestionsCubit, QuestionsInitial>(
            builder: (context, state) {
              return GlobalButton(
                buttonName: 'Xeyr',
                buttonColor: state.isFirstChild == null
                    ? Colors.white
                    : !state.isFirstChild!
                        ? Color(0xffFFD3E2)
                        : Colors.white,
                borderColor: ColorConstants.primaryColor,
                textColor: ColorConstants.primaryColor,
                onPressed: () {
                  questionCubit.updateQuestionThreeAnswer(false);
                  questionCubit.updateIsActiveButton();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
