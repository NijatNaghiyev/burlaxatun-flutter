import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:burla_xatun/cubits/doctor_notification/doctor_notification_state.dart';
import 'package:burla_xatun/data/contractor/dr_notifications_contract.dart';

enum DrNotificationStatus { initial, loading, success, error }

class DoctorNotificationCubit extends Cubit<DoctorNotificationState> {
  DoctorNotificationCubit(this.drNotificationsContract)
      : super(DoctorNotificationState());

  final DrNotificationsContract drNotificationsContract;

  Future<void> getDrNotifications() async {
    try {
      emit(state.copyWith(drNotificationStatus: DrNotificationStatus.loading));
      final response = await drNotificationsContract.getDrNotifications();

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(state.copyWith(
          drNotificationStatus: DrNotificationStatus.success,
        ));
      }
    } catch (e, s) {
      log('Error occured while getting dr notifications: e', stackTrace: s);
      emit(state.copyWith(drNotificationStatus: DrNotificationStatus.error));
    }
  }
}
