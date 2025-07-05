import 'package:burla_xatun/data/services/remote/base_network_service.dart';
import 'package:burla_xatun/utils/constants/endpoints_constants.dart';
import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';
import 'package:dio/dio.dart';

class RefreshTokenService {
  Future<Response<dynamic>> refreshToken(
      Map<String, dynamic> refreshToken) async {
    String url = EndpointsConstants.refreshToken;

    final response =
        await BaseNetwork.instance.post(path: url, postData: refreshToken);

    if (response.statusCode.isSuccess) {
      return response;
    }
    throw Exception();
  }
}
