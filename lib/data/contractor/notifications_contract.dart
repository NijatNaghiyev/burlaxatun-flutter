import 'package:dio/dio.dart';

abstract class NotificationsContract {
  Future<Response<dynamic>> getNotifications();
}
