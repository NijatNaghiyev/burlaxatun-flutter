import 'package:burla_xatun/data/contractor/notifications_contract.dart';
import 'package:burla_xatun/data/services/remote/notification_service.dart';
import 'package:dio/src/response.dart';

class NotificationsRepo implements NotificationsContract {
  NotificationsRepo(this.notificationService);

  final NotificationService notificationService;

  @override
  Future<Response> getNotifications() {
    return notificationService.getNotifications();
  }
}
