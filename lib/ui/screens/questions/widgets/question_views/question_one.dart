import 'package:flutter/material.dart';

import '../../../../../data/models/local/question_one_options_model.dart';
import '../../../../../utils/constants/padding_constants.dart';
import '../../../../../utils/extensions/num_extensions.dart';
import '../../../../widgets/global_text.dart';
import 'question_one_buttons.dart';

class QuestionOne extends StatelessWidget {
  const QuestionOne({super.key});

  @override
  Widget build(BuildContext context) {
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
          for (int i = 0; i < 3; i++)
            QuestionOneButton(
              buttonName: QuestionOneOptionsModel.options[i].option,
              optionIndex: i,
            )
        ],
      ),
    );
  }
}
