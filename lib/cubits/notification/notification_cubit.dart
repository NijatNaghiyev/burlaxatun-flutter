import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:burla_xatun/data/contractor/notifications_contract.dart';
import 'package:burla_xatun/data/models/remote/response/notifications_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'notification_state.dart';

enum NotificationStatus { initial, loading, error, networkError, success }

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.notificationsContract) : super(NotificationState());

  final NotificationsContract notificationsContract;

  Future<void> getNofitications() async {
    try {
      emit(state.copyWith(notificationStatus: NotificationStatus.loading));
      final response = await notificationsContract.getNotifications();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as List;
        final notifications =
            data.map((e) => NotificationsModel.fromJson(e)).toList();
        emit(state.copyWith(
          notificationStatus: NotificationStatus.success,
          notifications: notifications,
        ));
      }
    } on DioException catch (e, s) {
      log('Error occured while getting notifications: $e', stackTrace: s);
      emit(state.copyWith(notificationStatus: NotificationStatus.error));
    }
  }
}
