import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/questions_cubit/questions_cubit.dart';
import '../../../utils/extensions/num_extensions.dart';
import '../../widgets/global_appbar.dart';
import '../../widgets/global_dots.dart';
import 'widgets/davam_et_button.dart';
import 'widgets/questions_page_view.dart';

class Questions extends StatelessWidget {
  const Questions({super.key});

  @override
  Widget build(BuildContext context) {
    final questionsCubit = context.read<QuestionsCubit>();
    return Scaffold(
      appBar: GlobalAppbar(),
      body: Center(
        child: Column(
          children: [
            36.h,
            if (questionsCubit.questionViews.length > 3)
              SizedBox.shrink()
            else
              GlobalDots(
                controller: questionsCubit.pageController,
              ),
            56.h,
            QuestionsPageView(),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: BlocBuilder<QuestionsCubit, QuestionsState>(
                builder: (context, state) {
                  return DavamEt(
                    isActive: questionsCubit.currentIndex != null,
                    onPressed: () => questionsCubit.currentIndex != null
                        ? questionsCubit.nextQuestion()
                        : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
