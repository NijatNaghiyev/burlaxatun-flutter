import 'dart:developer';

import 'package:burla_xatun/data/services/remote/base_network_service.dart';
import 'package:burla_xatun/utils/constants/endpoints_constants.dart';
import 'package:burla_xatun/utils/di/locator.dart';
import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';
import 'package:dio/dio.dart';

import '../../local/login_token_service.dart';

class MedicinePatchService {
  String endpoint(String slug) =>
      EndpointsConstants.medicinePatch.replaceAll('{slug}', slug);

  Future<bool> patchMedicine({
    required String slug,
    required String name,
    required String dose,
    required String frequency,
    required DateTime startDate,
    required DateTime endDate,
    required String status,
  }) async {
    final token = locator<LoginTokenService>().token;

    final requestBody = {
      "name": name,
      "dose": dose,
      "frequency": frequency,
      "start_date":
          "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
      "end_date":
          "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
      "status": status,
    };

    log('Medicine PATCH request body: $requestBody');

    final response = await BaseNetwork.instance.patch(
      path: endpoint(slug),
      postData: requestBody,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    log('Medicine PATCH response: ${response.data}');

    return response.statusCode.isSuccess;
  }
}
