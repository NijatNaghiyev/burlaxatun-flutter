part of 'medicine_patch_cubit.dart';

enum MedicinePatchStatus { initial, loading, success, failure, networkError }

final class MedicinePatchState extends Equatable {
  const MedicinePatchState({
    required this.status,
    this.message = '',
  });

  final MedicinePatchStatus status;
  final String message;

  MedicinePatchState copyWith({
    MedicinePatchStatus? status,
    String? message,
  }) {
    return MedicinePatchState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, message];
}
