import 'package:burla_xatun/data/contractor/dr_notifications_contract.dart';
import 'package:burla_xatun/data/services/remote/dr_notifications_service.dart';
import 'package:dio/src/response.dart';

class DrNotificationsRepo implements DrNotificationsContract {
  DrNotificationsRepo(this.drNotificationsService);

  final DrNotificationsService drNotificationsService;

  @override
  Future<Response> getDrNotifications() {
    return drNotificationsService.getDrNotifications();
  }
}
