import 'dart:developer';

import 'package:burla_xatun/cubits/signup_cubit/signup_cubit.dart';
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
    final signUpCubit = context.read<SignupCubit>();
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Qeydiyyat',
        onTap: () {
          questionsCubit.goBack();
        },
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
              child: BlocConsumer<SignupCubit, SignupCubitState>(
                listener: (context, state) {
                  if (state is SignupCubitSuccess) {
                    log('success register');
                  }
                },
                builder: (context, state) {
                  if (state is SignupCubitLoading) {
                    return CircularProgressIndicator.adaptive();
                  }
                  return BlocBuilder<QuestionsCubit, QuestionsInitial>(
                    builder: (context, state) {
                      return DavamEt(
                        isActive: state.isActiveButton,
                        onPressed: () async {
                          state.isActiveButton
                              ? questionsCubit
                                          .questionOneButtonNotifier.value ==
                                      0
                                  ? state.iDontKnow
                                      ? context.push('/calculate')
                                      : questionsCubit.nextQuestion()
                                  : await signUpCubit.register()
                              : null;
                        },
                      );
                    },
                  );
                },
              )),
        ],
      ),
    );
  }
}
