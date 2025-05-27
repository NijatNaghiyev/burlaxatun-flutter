import 'dart:developer';

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
    // final signUpCubit = context.read<SignupCubit>();
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Qeydiyyat',
        leading: BlocBuilder<QuestionsCubit, QuestionsInitial>(
          buildWhen: (previous, current) {
            return previous.questionPageIndex != current.questionPageIndex &&
                current.questionPageIndex == 3;
          },
          builder: (context, state) {
            return state.questionPageIndex == 3
                ? SizedBox.fromSize()
                : Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0xff344054),
                  );
          },
        ),
        onLeadingTap: () {
          // context.pop();
          questionsCubit.goBack();
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<QuestionsCubit, QuestionsInitial>(
            builder: (_, state) {
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
            child: BlocConsumer<QuestionsCubit, QuestionsInitial>(
              buildWhen: (previous, current) {
                return previous.isActiveButton != current.isActiveButton ||
                    previous.iDontKnow != current.iDontKnow ||
                    previous.userUpdateStatus != current.userUpdateStatus ||
                    previous.questionPageIndex != current.questionPageIndex;
              },
              listenWhen: (previous, current) {
                return previous.userUpdateStatus != current.userUpdateStatus;
              },
              listener: (BuildContext context, QuestionsInitial state) {
                if (state.userUpdateStatus == UserUpdateStatus.error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('error'),
                    ),
                  );
                } else if (state.userUpdateStatus == UserUpdateStatus.success) {
                  if (state.questionPageIndex == 0) {
                    context.go('/home');
                  } else if (state.isFirstChild == false) {
                    log('go add child');
                  }
                }
              },
              builder: (context, state) {
                if (state.userUpdateStatus == UserUpdateStatus.loading) {
                  return CircularProgressIndicator.adaptive();
                }
                return DavamEt(
                  isActive: state.isActiveButton,
                  onPressed: () {
                    state.questionPageIndex != 3
                        ? state.iDontKnow
                            ? context.push('/calculate')
                            : questionsCubit.nextQuestion()
                        : context.go('/home');
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
