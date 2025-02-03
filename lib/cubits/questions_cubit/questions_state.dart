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
    required this.birthDateString,
    required this.initialDateTime,
    required this.ultrasoundRadioValue,
    required this.ultrasoundDayCountString,
    required this.ultrasoundWeekCountString,
    required this.isShowUltrasoundDays,
    required this.isShowUltrasoundWeeks,
  });

  final int? currentQuestionOneOptionIndex;
  final int? selectedCalculateOptionIndex;
  final int questionPageIndex;
  final int focusedWeekIndex;
  final String ultrasoundWeekCountString;
  final String ultrasoundDayCountString;
  final bool iDontKnow;
  final bool showOptions;
  final bool showDays;
  final bool showCalendar;
  final bool isActiveButton;
  final bool? isFirstChild;
  final bool isShowUltrasoundDays;
  final bool isShowUltrasoundWeeks;
  final String selectedCalculateOptionString;
  final String selectedPeriodTimeString;
  final String birthDateString;
  final String? ultrasoundRadioValue;
  final DateTime selectedDay;
  final DateTime initialDateTime;

  @override
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
        birthDateString,
        initialDateTime,
        ultrasoundRadioValue,
        ultrasoundDayCountString,
        ultrasoundWeekCountString,
        isShowUltrasoundDays,
        isShowUltrasoundWeeks,
      ];

  QuestionsInitial copyWith({
    int? currentQuestionOneOptionIndex,
    int? selectedCalculateOptionIndex,
    int? questionPageIndex,
    int? focusedWeekIndex,
    String? ultrasoundWeekCountString,
    String? ultrasoundDayCountString,
    bool? iDontKnow,
    bool? showOptions,
    bool? showDays,
    bool? showCalendar,
    bool? isActiveButton,
    bool? isFirstChild,
    bool? isShowUltrasoundDays,
    bool? isShowUltrasoundWeeks,
    String? selectedCalculateOptionString,
    String? selectedPeriodTimeString,
    String? birthDateString,
    String? ultrasoundRadioValue,
    DateTime? selectedDay,
    DateTime? initialDateTime,
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
      birthDateString: birthDateString ?? this.birthDateString,
      initialDateTime: initialDateTime ?? this.initialDateTime,
      ultrasoundRadioValue: ultrasoundRadioValue ?? this.ultrasoundRadioValue,
      ultrasoundDayCountString:
          ultrasoundDayCountString ?? this.ultrasoundDayCountString,
      ultrasoundWeekCountString:
          ultrasoundWeekCountString ?? this.ultrasoundWeekCountString,
      isShowUltrasoundDays: isShowUltrasoundDays ?? this.isShowUltrasoundDays,
      isShowUltrasoundWeeks:
          isShowUltrasoundWeeks ?? this.isShowUltrasoundWeeks,
    );
  }
}
