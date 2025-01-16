import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/questions_cubit/questions_cubit.dart';

class QuestionsPageView extends StatelessWidget {
  const QuestionsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final questionsCubit = context.read<QuestionsCubit>();
    return Expanded(
      flex: 10,
      child: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: questionsCubit.pageController,
          itemCount: questionsCubit.questionViews.length,
          itemBuilder: (_, i) {
            return questionsCubit.questionViews[i];
          },
        ),
    );
  }
}
