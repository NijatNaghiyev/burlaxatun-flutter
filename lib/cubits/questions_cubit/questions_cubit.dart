import '../../ui/screens/questions/widgets/question_views/add_your_child.dart';
import '../../ui/screens/questions/widgets/question_views/register_success.dart';

import '../../ui/screens/questions/widgets/question_views/question_one.dart';
import '../../ui/screens/questions/widgets/question_views/question_three.dart';
import '../../ui/screens/questions/widgets/question_views/question_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit() : super(QuestionsInitial(currentIndex: null));

  final pageController = PageController();

  int? currentIndex;

  int questionPageIndex = 0;

  final List questionViews = [
    QuestionOne(),
    QuestionTwo(),
    QuestionThree(),
    RegisterSuccess(),
    AddYourChild(),
  ];

  void selectOption(int v) {
    currentIndex = v;
    emit(QuestionsInitial(currentIndex: currentIndex));
  }

  void nextQuestion() {
    questionPageIndex++;
    pageController.jumpToPage(questionPageIndex);
  }
}
