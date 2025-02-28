import 'dart:developer';

import 'package:burla_xatun/data/models/remote/response/calculate_birth_response_model.dart';
import 'package:burla_xatun/data/services/local/token_hive_service.dart';
import 'package:burla_xatun/data/services/remote/base_network_service.dart';
import 'package:burla_xatun/utils/constants/endpoints_constants.dart';

class PregnancyService {
  Future<CalculatedData> getCalculatedData({
    required int type,
    required String? date,
    required int? period,
    required int? ivf,
    required int? week,
    required int? day,
  }) async {
    final token = await TokenHiveService.instance.getToken();
    final url = EndpointsConstants.pregnancyCalculateDetails;
    final body = {
      'type': type,
      'date': date,
      'period': period,
      'ivf': ivf,
      'week': week,
      'day': day,
    };
    log('$body');
    final response =
        await BaseNetwork.instance.getDio(token: token).post(url, data: body);
    log('calculated data: $response');
    if (response.statusCode == 200) {
      final calculatedData =
          CalculateBirthResponseModel.fromJson(response.data);
      log('calculated data: $calculatedData');
      return calculatedData.data;
    }
    throw Exception('Something has happened while calculating');
  }
}
