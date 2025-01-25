import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../cubits/questions_cubit/questions_cubit.dart';
import '../../../cubits/questions_cubit/questions_state.dart';
import '../../../utils/extensions/num_extensions.dart';
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
        onTap: () => context.pop(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<QuestionsCubit, QuestionsInitial>(
            builder: (context, state) {
              return state.questionPageIndex < 3
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
            child: BlocBuilder<QuestionsCubit, QuestionsInitial>(
              builder: (context, state) {
                return DavamEt(
                  isActive: state.isActiveButton,
                  onPressed: () {
                    questionsCubit.davamEtButton(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
