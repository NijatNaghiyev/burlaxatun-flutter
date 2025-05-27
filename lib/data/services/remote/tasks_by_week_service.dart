import 'package:burla_xatun/data/services/remote/base_network_service.dart';
import 'package:burla_xatun/utils/constants/endpoints_constants.dart';
import 'package:dio/dio.dart';

class TasksByWeekService {
  Future<Response<dynamic>> getTasksByWeek() async {
    const url = EndpointsConstants.tasksByWeek;

    final response = await BaseNetwork.instance.getDio().get(url);

    return response;
  }
}
