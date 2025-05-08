part of 'medicine_cubit.dart';

enum MedicineStatus { initial, loading, success, failure, networkError }

final class MedicineState extends Equatable {
  const MedicineState({
    required this.status,
    required this.response,
    required this.errorMessage,
  });

  final MedicineStatus status;
  final MedicineResponse? response;
  final String? errorMessage;

  MedicineState copyWith({
    MedicineStatus? status,
    MedicineResponse? response,
    String? errorMessage,
  }) {
    return MedicineState(
      status: status ?? this.status,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory MedicineState.initial() => const MedicineState(
        status: MedicineStatus.initial,
        response: null,
        errorMessage: null,
      );

  @override
  List<Object?> get props => [status, response, errorMessage];
}
