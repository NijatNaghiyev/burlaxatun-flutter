part of 'daily_rec_detail_cubit.dart';

enum DailyRecDetailStatus { initial, loading, success, failure, networkError }

final class DailyRecDetailState extends Equatable {
  const DailyRecDetailState({
    required this.status,
    required this.response,
    required this.errorMessage,
  });

  final DailyRecDetailStatus status;
  final DailyRecDetailResponse? response;
  final String? errorMessage;

  DailyRecDetailState copyWith({
    DailyRecDetailStatus? status,
    DailyRecDetailResponse? response,
    String? errorMessage,
  }) {
    return DailyRecDetailState(
      status: status ?? this.status,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory DailyRecDetailState.initial() => const DailyRecDetailState(
        status: DailyRecDetailStatus.initial,
        response: null,
        errorMessage: null,
      );

  @override
  List<Object?> get props => [status, response, errorMessage];
}
