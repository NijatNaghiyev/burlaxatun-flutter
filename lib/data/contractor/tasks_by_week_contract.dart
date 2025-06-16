import 'package:dio/dio.dart';

abstract class TasksByWeekContract {
  Future<Response<dynamic>> getTasksByWeeks();
}
