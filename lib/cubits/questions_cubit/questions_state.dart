part of 'questions_cubit.dart';

@immutable
abstract class QuestionsState {}

class QuestionsInitial extends QuestionsState {
  QuestionsInitial({this.currentIndex});

  final int? currentIndex;
}
