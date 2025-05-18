import 'package:burla_xatun/data/services/local/login_token_service.dart';
import 'package:burla_xatun/data/services/remote/base_network_service.dart';
import 'package:burla_xatun/utils/constants/endpoints_constants.dart';
import 'package:burla_xatun/utils/di/locator.dart';
import 'package:dio/dio.dart';

class DoctorReservationService {
  Future<Response<dynamic>> reserveDoctor({
    required Map<String, dynamic> postData,
  }) async {
    final url = EndpointsConstants.doctorReserve;
    final token = locator<LoginTokenService>().token;

    final response = await BaseNetwork.instance
        .getDio(token: token)
        .post(url, data: postData);

    return response;
  }
}
