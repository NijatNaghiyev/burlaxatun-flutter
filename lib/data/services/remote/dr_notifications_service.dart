import 'package:burla_xatun/data/services/local/login_token_service.dart';
import 'package:burla_xatun/data/services/remote/base_network_service.dart';
import 'package:burla_xatun/utils/constants/endpoints_constants.dart';
import 'package:burla_xatun/utils/di/locator.dart';
import 'package:dio/dio.dart';

class DrNotificationsService {
  Future<Response<dynamic>> getDrNotifications() async {
    final url = EndpointsConstants.myReservations;

    final token = locator<LoginTokenService>().token;

    final response = BaseNetwork.instance.getDio(token: token).get(url);

    return response;
  }
}
