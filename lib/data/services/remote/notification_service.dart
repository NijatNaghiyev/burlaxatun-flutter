import 'package:dio/dio.dart';

import '../../../utils/constants/endpoints_constants.dart';
import '../../../utils/di/locator.dart';
import '../local/login_token_service.dart';
import 'base_network_service.dart';

class NotificationService {
  Future<Response<dynamic>> getNotifications() async {
    final url = EndpointsConstants.notifications;

    final accessToken = locator<LoginTokenService>().token;

    final response =
        await BaseNetwork.instance.getDio(token: accessToken).get(url);

    return response;
  }
}
