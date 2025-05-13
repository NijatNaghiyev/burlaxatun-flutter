part of 'doctors_detail_cubit.dart';

enum DoctorDetailStatus { initial, loading, success, failure, networkError }

final class DoctorDetailState extends Equatable {
  const DoctorDetailState({
    required this.status,
    required this.response,
    required this.errorMessage,
  });

  final DoctorDetailStatus status;
  final DoctorDetailResponse? response;
  final String? errorMessage;

  DoctorDetailState copyWith({
    DoctorDetailStatus? status,
    DoctorDetailResponse? response,
    String? errorMessage,
  }) {
    return DoctorDetailState(
      status: status ?? this.status,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory DoctorDetailState.initial() => const DoctorDetailState(
        status: DoctorDetailStatus.initial,
        response: null,
        errorMessage: null,
      );

  @override
  List<Object?> get props => [status, response, errorMessage];
}
