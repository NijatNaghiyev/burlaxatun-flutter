import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui/screens/questions/widgets/calculate_birth_view/calculate_birth.dart';
import '../../ui/screens/questions/widgets/question_views/add_your_child.dart';
import '../../ui/screens/questions/widgets/question_views/question_one.dart';
import '../../ui/screens/questions/widgets/question_views/question_three.dart';
import '../../ui/screens/questions/widgets/question_views/question_two.dart';
import '../../ui/screens/questions/widgets/question_views/register_success.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit()
      : super(QuestionsInitial(
          currentIndex: null,
          currentPageIndex: 0,
          iDontKnow: false,
          showOptions: false,
        ));

  final pageController = PageController();
  int? currentIndex;
  int? selectedOptionIndex;
  int questionPageIndex = 0;
  bool iDontKnow = false;
  bool showOptions = false;
  bool showCalendar = false;
  String selectedCalculateOption = 'hesablama usulunu secin...';
  DateTime selectedDay = DateTime.now();

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

  void updateSelectedDay(DateTime v){
    selectedDay = v;
    emit(QuestionsInitial());
  }

  void nextQuestion() {
    log('question page: $questionPageIndex');
    if (questionPageIndex < 4) {
      questionPageIndex = questionPageIndex + 1;
      emit(QuestionsInitial());
      questionPageIndex < 3
          ? pageController.animateToPage(
              questionPageIndex,
              duration: Durations.medium2,
              curve: Curves.linear,
            )
          : pageController.jumpToPage(questionPageIndex);
    }
  }

  void iDontKnowToggle(bool v) {
    iDontKnow = !v;
    emit(QuestionsInitial(iDontKnow: iDontKnow));
  }

  void goToCalculateView(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => QuestionsCubit(),
          child: CalculateBirth(),
        ),
      ),
    );
  }

  void showOptionsToggle() {
    showCalendar = false;
    showOptions = !showOptions;
    emit(QuestionsInitial(showOptions: showOptions));
  }

  void showCalendarToggle() {
    showOptions = false;
    showCalendar = !showCalendar;
    emit(QuestionsInitial());
  }

  void selectCalculateOption(int v) {
    selectedOptionIndex = v;
    emit(QuestionsInitial(selectedOptionIndex: selectedOptionIndex));
  }

  void updateCalculateOption(String v) {
    selectedCalculateOption = v;
    emit(QuestionsInitial(selectedCalculateOption: selectedCalculateOption));
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
