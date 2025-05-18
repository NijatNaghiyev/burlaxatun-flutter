part of 'doctor_reservation_cubit.dart';

class DoctorReservationState extends Equatable {
  const DoctorReservationState({
    this.doctorReservStatus = DoctorReservStatus.initial,
    this.reserveDate,
    this.reserveTime,
    this.errorMessage,
  });

  final DoctorReservStatus doctorReservStatus;
  final String? reserveDate;
  final String? reserveTime;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        doctorReservStatus,
        reserveDate,
        reserveTime,
        errorMessage,
      ];

  DoctorReservationState copyWith({
    DoctorReservStatus? doctorReservStatus,
    String? reserveDate,
    String? reserveTime,
    String? errorMessage,
  }) {
    return DoctorReservationState(
      doctorReservStatus: doctorReservStatus ?? this.doctorReservStatus,
      reserveDate: reserveDate ?? this.reserveDate,
      reserveTime: reserveTime ?? this.reserveTime,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
