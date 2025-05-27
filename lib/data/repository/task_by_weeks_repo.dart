import 'package:burla_xatun/data/contractor/tasks_by_week_contract.dart';
import 'package:burla_xatun/data/services/remote/tasks_by_week_service.dart';
import 'package:dio/src/response.dart';

class TasksByWeeksRepo implements TasksByWeekContract {
  TasksByWeeksRepo(this._tasksByWeekService);

  final TasksByWeekService _tasksByWeekService;

  @override
  Future<Response> getTasksByWeeks() {
    return _tasksByWeekService.getTasksByWeek();
  }
}
