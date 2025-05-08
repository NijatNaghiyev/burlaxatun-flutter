part of 'medicine_create_cubit.dart';

enum MedicineCreateStatus { initial, loading, success, failure, networkError }

final class MedicineCreateState extends Equatable {
  const MedicineCreateState({
    required this.status,
    this.message = '',
  });

  final MedicineCreateStatus status;
  final String message;

  MedicineCreateState copyWith({
    MedicineCreateStatus? status,
    String? message,
  }) {
    return MedicineCreateState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, message];
}
