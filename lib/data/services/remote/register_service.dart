import 'dart:developer';

import 'package:burla_xatun/data/services/remote/base_network_service.dart';
import 'package:burla_xatun/utils/constants/endpoints_constants.dart';
import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';

class RegisterService {
  Future<bool> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final endpoint = EndpointsConstants.register;
    final requestBody = {
      'email': email,
      'full_name': fullName,
      'password': password,
    };
    log("Register service request body: $requestBody");

    final response = await BaseNetwork.instance.getDio().post(
          endpoint,
          data: requestBody,
        );
    log("Register service response: $response");

    return response.statusCode.isSuccess;
  }
}
