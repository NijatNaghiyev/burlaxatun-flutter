import 'dart:async';
import 'dart:developer';

import 'package:burla_xatun/cubits/main/main_cubit.dart';
import 'package:burla_xatun/ui/screens/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui/screens/questions/widgets/calculate_birth_view/calculate_birth.dart';
import '../../ui/screens/questions/widgets/calculate_birth_view/widgets/calculation_result_dialog.dart';
import '../../ui/screens/questions/widgets/calculate_birth_view/widgets/methods_views/first_day_of_last_period.dart';
import '../../ui/screens/questions/widgets/calculate_birth_view/widgets/methods_views/ivf.dart';
import '../../ui/screens/questions/widgets/calculate_birth_view/widgets/methods_views/ultrasound.dart';
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
  int focusedWeekIndex = 0;
  bool iDontKnow = false;
  bool showOptions = false;
  bool showDays = false;
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

  final List calculationOptions = [
    SizedBox.shrink(),
    FirstDayOfLastPeriod(),
    Ivf(),
    Ultrasound(),
  ];

  void selectOption(int v) {
    currentIndex = v;
    emit(QuestionsInitial(currentIndex: currentIndex));
  }

  void updateSelectedDay(DateTime v) {
    selectedDay = v;
    emit(QuestionsInitial());
  }

  void updateFocusedWeekIndex(int v) {
    focusedWeekIndex = v;
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

  void davamEtButton(context) {
    currentIndex != null
        ? iDontKnow
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (context) => QuestionsCubit(),
                    child: CalculateBirth(),
                  ),
                ),
              )
            : nextQuestion()
        : null;
  }

  void showOptionsToggle() {
    showCalendar = false;
    showDays = false;
    showOptions = !showOptions;
    emit(QuestionsInitial(showOptions: showOptions));
  }

  void showCalendarToggle() {
    showOptions = false;
    showDays = false;
    showCalendar = !showCalendar;
    emit(QuestionsInitial());
  }

  void showDaysToggle() {
    showOptions = false;
    showCalendar = false;
    showDays = !showDays;
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

  void calculate(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return BlocProvider(
          create: (context) => QuestionsCubit(),
          child: CalculationResultDialog(),
        );
      },
    );
  }

  void goToMainPage(context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => MainCubit(),
          child: MainPage(),
        ),
      ),
      (route) => false,
    );
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
