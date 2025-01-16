import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/questions_cubit/questions_cubit.dart';
import '../../widgets/global_appbar.dart';
import '../../widgets/global_dots.dart';
import 'widgets/question_views/davam_et_button.dart';
import 'widgets/questions_page_view.dart';

class Questions extends StatelessWidget {
  const Questions({super.key});

  @override
  Widget build(BuildContext context) {
    final questionsCubit = context.read<QuestionsCubit>();
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Qeydiyyat',
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<QuestionsCubit, QuestionsState>(
              builder: (context, state) {
                return questionsCubit.questionPageIndex < 3
                    ? Column(
                      children: [
                        36.h,
                        GlobalDots(
                            controller: questionsCubit.pageController,
                          ),
                      ],
                    )
                    : SizedBox.shrink();
              },
            ),
            QuestionsPageView(),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: BlocBuilder<QuestionsCubit, QuestionsState>(
                builder: (context, state) {
                  return DavamEt(
                    isActive: questionsCubit.currentIndex != null,
                    onPressed: () => questionsCubit.davamEtButton(context),
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
