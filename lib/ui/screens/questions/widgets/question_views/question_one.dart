import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/questions_cubit/questions_cubit.dart';
import '../../../../../data/models/local/question_one_options_model.dart';
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
      padding: PaddingConstants.h20 + EdgeInsets.only(top: 56),
      child: Column(
        children: [
          GlobalText(
            text: 'Siz hamiləsiniz?',
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          59.h,
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, i) {
              return QuestionOneButton(
                buttonName: QuestionOneOptionsModel.options[i].option,
                optionIndex: i,
                questionsCubit: questionsCubit,
              );
            },
          ),
        ],
      ),
    );
  }
}
