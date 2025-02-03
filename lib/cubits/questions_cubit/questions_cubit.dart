import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui/screens/main/views/home_page/home/home_page.dart';
import '../../ui/screens/questions/widgets/calculate_birth_view/calculate_birth.dart';
import '../../ui/screens/questions/widgets/calculate_birth_view/widgets/calculation_result_dialog.dart';
import '../../ui/screens/questions/widgets/calculate_birth_view/widgets/methods_views/first_day_of_last_period.dart';
import '../../ui/screens/questions/widgets/calculate_birth_view/widgets/methods_views/ivf.dart';
import '../../ui/screens/questions/widgets/calculate_birth_view/widgets/methods_views/ultrasound.dart';
import '../../ui/screens/questions/widgets/question_views/add_your_child.dart';
import '../../ui/screens/questions/widgets/question_views/pick_birth_date_widget.dart';
import '../../ui/screens/questions/widgets/question_views/question_one.dart';
import '../../ui/screens/questions/widgets/question_views/question_three.dart';
import '../../ui/screens/questions/widgets/question_views/question_two.dart';
import '../../ui/screens/questions/widgets/question_views/register_success.dart';
import 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsInitial> {
  QuestionsCubit()
      : super(QuestionsInitial(
          currentQuestionOneOptionIndex: null,
          selectedCalculateOptionIndex: null,
          questionPageIndex: 0,
          focusedWeekIndex: 0,
          iDontKnow: false,
          showOptions: false,
          showDays: false,
          showCalendar: false,
          selectedCalculateOptionString: 'Hesablama üsulunu seçin...',
          selectedPeriodTimeString: 'Period muddetini secin...',
          birthDateString: 'Dogum tarixini qeyd edinnn',
          selectedDay: DateTime.now(),
          isActiveButton: false,
          isFirstChild: null,
        ));

  final pageController = PageController();
  final scrollController = ScrollController();
  final ValueNotifier<int?> questionOneButtonNotifier =
      ValueNotifier<int?>(null);

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

  void scrollBottom() {
    if (!state.showDays) {
      showDaysToggle();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      });
    } else {
      showDaysToggle();
    }
  }

  void updateIsActiveButton({int? v}) {
    switch (state.questionPageIndex) {
      case 0:
        if (questionOneButtonNotifier.value != null) {
          emit(state.copyWith(
            isActiveButton: true,
          ));
        }
        break;
      case 1:
        if (state.iDontKnow || state.focusedWeekIndex != 0) {
          emit(state.copyWith(isActiveButton: true));
        } else {
          emit(state.copyWith(isActiveButton: false));
        }
        break;
      case 2:
        if (state.isFirstChild != null) {
          emit(state.copyWith(isActiveButton: true));
        }
        break;
      default:
        log('default');
    }
  }

  void updateCurrentQuestionOneOption(int v) {
    emit(state.copyWith(currentQuestionOneOptionIndex: v));
  }

  void updateSelectedDay(DateTime v) {
    emit(state.copyWith(selectedDay: v));
  }

  void updateQuestionThreeAnswer(bool v) {
    emit(state.copyWith(isFirstChild: v));
  }

  void updatePeriodTime(String v) {
    emit(state.copyWith(selectedPeriodTimeString: v));
  }

  void updateFocusedWeekIndex(int v) {
    emit(state.copyWith(focusedWeekIndex: v));
  }

  void nextQuestion() {
    if (state.questionPageIndex <= 2) {
      emit(state.copyWith(questionPageIndex: state.questionPageIndex + 1));
      log('question page: ${state.questionPageIndex}');
      if (state.questionPageIndex < 3) {
        pageController.animateToPage(
          state.questionPageIndex,
          duration: Durations.medium2,
          curve: Curves.linear,
        );
        emit(state.copyWith(isActiveButton: false));
      } else if (state.isFirstChild! && state.questionPageIndex < 4) {
        pageController.jumpToPage(state.questionPageIndex);
      } else if (!state.isFirstChild! && state.questionPageIndex < 4) {
        emit(state.copyWith(questionPageIndex: state.questionPageIndex + 1));
        pageController.jumpToPage(state.questionPageIndex);
      }
      // }
    } else if (state.questionPageIndex == 3) {
      log('THIS WAS SUCCESS REGISTER AND GO TO MAIN PAGE');
    } else {
      log('THIS WAS ADD UR CHILD AND GO TO MAIN PAGE');
    }
  }

  void davamEtButton(context) {
    log('${state.isActiveButton}');

    state.isActiveButton
        ? state.iDontKnow
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

  void iDontKnowToggle(bool v) {
    emit(state.copyWith(iDontKnow: !v));
  }

  void showOptionsToggle() {
    log('${state.showOptions}');
    emit(state.copyWith(
      showOptions: !state.showOptions,
      showDays: false,
      showCalendar: false,
    ));
  }

  void showCalendarToggle() {
    emit(state.copyWith(
      showOptions: false,
      showDays: false,
      showCalendar: !state.showCalendar,
    ));
  }

  void showDaysToggle() {
    emit(state.copyWith(
      showOptions: false,
      showDays: !state.showDays,
      showCalendar: false,
    ));
  }

  void selectCalculateOption(int v) {
    emit(state.copyWith(selectedCalculateOptionIndex: v));
  }

  void updateCalculateOptionName(String v) {
    emit(state.copyWith(selectedCalculateOptionString: v));
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

  void showBirthDateBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return BlocProvider(
          create: (context) => QuestionsCubit(),
          child: PickBirthDateWidget(),
        );
      },
    ).then((onValue) {
      updateBirthDate(onValue);
    });
  }

  void updateBirthDate(String v) {
    emit(state.copyWith(birthDateString: v));
    log(state.birthDateString);
  }

  void goToMainPage(context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => HomePage(),
      ),
      (route) => false,
    );
  }

  @override
  Future<void> close() {
    pageController.dispose();
    scrollController.dispose();
    questionOneButtonNotifier.dispose();
    return super.close();
  }
}
