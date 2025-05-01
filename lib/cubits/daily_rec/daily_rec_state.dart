part of 'daily_rec_cubit.dart';

enum DailyRecStatus { initial, loading, success, failure, networkError }

final class DailyRecState extends Equatable {
  const DailyRecState({
    required this.status,
    required this.response,
    required this.errorMessage,
  });

  final DailyRecStatus status;
  final DailyRecResponse? response;
  final String? errorMessage;

  DailyRecState copyWith({
    DailyRecStatus? status,
    DailyRecResponse? response,
    String? errorMessage,
  }) {
    return DailyRecState(
      status: status ?? this.status,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory DailyRecState.initial() => const DailyRecState(
        status: DailyRecStatus.initial,
        response: null,
        errorMessage: null,
      );

  @override
  List<Object?> get props => [status, response, errorMessage];
}
