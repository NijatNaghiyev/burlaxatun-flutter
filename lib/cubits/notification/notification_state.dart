part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  const NotificationState({
    this.notificationStatus = NotificationStatus.initial,
    this.notifications,
  });

  final NotificationStatus notificationStatus;
  final List<NotificationsModel>? notifications;

  @override
  List<Object?> get props => [
        notificationStatus,
        notifications,
      ];

  NotificationState copyWith({
    NotificationStatus? notificationStatus,
    List<NotificationsModel>? notifications,
  }) {
    return NotificationState(
      notificationStatus: notificationStatus ?? this.notificationStatus,
      notifications: notifications ?? this.notifications,
    );
  }
}
