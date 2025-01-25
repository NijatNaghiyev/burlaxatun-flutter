// part of 'questions_cubit.dart';

// @immutable
// abstract class QuestionsState {}

import 'package:equatable/equatable.dart';

class QuestionsInitial extends Equatable {
  const QuestionsInitial({
    required this.currentQuestionOneOptionIndex,
    required this.selectedCalculateOptionIndex,
    required this.questionPageIndex,
    required this.focusedWeekIndex,
    required this.iDontKnow,
    required this.showOptions,
    required this.showDays,
    required this.showCalendar,
    required this.isActiveButton,
    required this.selectedCalculateOptionString,
    required this.selectedPeriodTimeString,
    required this.selectedDay,
    required this.isFirstChild,
  });

  final int? currentQuestionOneOptionIndex;
  final int? selectedCalculateOptionIndex;
  final int questionPageIndex;
  final int focusedWeekIndex;
  final bool iDontKnow;
  final bool showOptions;
  final bool showDays;
  final bool showCalendar;
  final bool isActiveButton;
  final bool? isFirstChild;
  final String selectedCalculateOptionString;
  final String selectedPeriodTimeString;
  final DateTime selectedDay;
  

  @override
  // TODO: implement props
  List<Object?> get props => [
        currentQuestionOneOptionIndex,
        selectedCalculateOptionIndex,
        questionPageIndex,
        focusedWeekIndex,
        iDontKnow,
        showDays,
        showCalendar,
        showOptions,
        selectedCalculateOptionString,
        selectedPeriodTimeString,
        selectedDay,
        isActiveButton,
        isFirstChild,
      ];

  QuestionsInitial copyWith({
    int? currentQuestionOneOptionIndex,
    int? selectedCalculateOptionIndex,
    int? questionPageIndex,
    int? focusedWeekIndex,
    bool? iDontKnow,
    bool? showOptions,
    bool? showDays,
    bool? showCalendar,
    bool? isActiveButton,
    bool? isFirstChild,
    String? selectedCalculateOptionString,
    String? selectedPeriodTimeString,
    DateTime? selectedDay,
  }) {
    return QuestionsInitial(
      currentQuestionOneOptionIndex: currentQuestionOneOptionIndex,
      selectedCalculateOptionIndex:
          selectedCalculateOptionIndex ?? this.selectedCalculateOptionIndex,
      questionPageIndex: questionPageIndex ?? this.questionPageIndex,
      focusedWeekIndex: focusedWeekIndex ?? this.focusedWeekIndex,
      iDontKnow: iDontKnow ?? this.iDontKnow,
      showOptions: showOptions ?? this.showOptions,
      showDays: showDays ?? this.showDays,
      showCalendar: showCalendar ?? this.showCalendar,
      selectedCalculateOptionString:
          selectedCalculateOptionString ?? this.selectedCalculateOptionString,
      selectedPeriodTimeString:
          selectedPeriodTimeString ?? this.selectedPeriodTimeString,
      selectedDay: selectedDay ?? this.selectedDay,
      isActiveButton: isActiveButton ?? this.isActiveButton,
      isFirstChild: isFirstChild ?? this.isFirstChild,
    );
  }
}
