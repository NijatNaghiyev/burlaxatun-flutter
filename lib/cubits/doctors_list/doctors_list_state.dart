part of 'doctors_list_cubit.dart';

enum DoctorsListStatus { initial, loading, success, failure, networkError }

final class DoctorsListState extends Equatable {
  const DoctorsListState({
    required this.status,
    required this.response,
    required this.errorMessage,
  });

  final DoctorsListStatus status;
  final DoctorsListResponse? response;
  final String? errorMessage;

  DoctorsListState copyWith({
    DoctorsListStatus? status,
    DoctorsListResponse? response,
    String? errorMessage,
  }) {
    return DoctorsListState(
      status: status ?? this.status,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory DoctorsListState.initial() => const DoctorsListState(
        status: DoctorsListStatus.initial,
        response: null,
        errorMessage: null,
      );

  @override
  List<Object?> get props => [status, response, errorMessage];
}
