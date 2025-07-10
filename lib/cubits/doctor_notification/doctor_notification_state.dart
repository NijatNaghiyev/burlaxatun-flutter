import 'package:burla_xatun/cubits/doctor_notification/doctor_notification_cubit.dart';
import 'package:equatable/equatable.dart';

class DoctorNotificationState extends Equatable {
  const DoctorNotificationState({
    this.drNotificationStatus = DrNotificationStatus.initial,
  });

  final DrNotificationStatus drNotificationStatus;

  @override
  List<Object> get props => [
        drNotificationStatus,
      ];

  DoctorNotificationState copyWith({
    DrNotificationStatus? drNotificationStatus,
  }) {
    return DoctorNotificationState(
      drNotificationStatus: drNotificationStatus ?? this.drNotificationStatus,
    );
  }
}
