import 'package:burla_xatun/data/services/remote/base_network_service.dart';
import 'package:burla_xatun/utils/constants/endpoints_constants.dart';
import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class UltrasoundService {
  Future<Response<dynamic>> getUltraSound() async {
    final url = EndpointsConstants.ultraSound;

    final response = await BaseNetwork.instance.getDio().get(url);

    if (response.statusCode.isSuccess) {
      return response;
    }
    throw Exception();
  }
}
