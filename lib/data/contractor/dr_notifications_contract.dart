import 'package:dio/dio.dart';

abstract class DrNotificationsContract {
  Future<Response<dynamic>> getDrNotifications();
}
