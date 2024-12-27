part of 'questions_cubit.dart';

@immutable
abstract class QuestionsState {}

class QuestionsInitial extends QuestionsState {
  QuestionsInitial({
    this.currentIndex,
    this.currentPageIndex = 0,
    this.iDontKnow = false,
    this.showOptions = false,
    this.showCalendar = false,
    this.selectedOptionIndex,
    this.selectedCalculateOption = 'Hesablama usulunu secin...',
  });

  final int? currentIndex;
  final int? selectedOptionIndex;
  final int currentPageIndex;
  final bool iDontKnow;
  final bool showOptions;
  final bool showCalendar;
  final String selectedCalculateOption;
}
