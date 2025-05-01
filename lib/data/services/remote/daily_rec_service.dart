import 'package:burla_xatun/data/services/remote/base_network_service.dart';
import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';

import '../../../utils/constants/endpoints_constants.dart';
import '../../models/remote/response/daily_rec_response.dart';

class DailyRecService {
  final endpoint = EndpointsConstants.dailyRec;

  Future<DailyRecResponse> getDailyRec() async {
    final response = await BaseNetwork.instance.getDio().get(endpoint);

    if (response.statusCode.isSuccess) {
      return DailyRecResponse.fromJson(response.data);
    } else if (response.statusCode.isFailure) {
      throw Exception('Failed to load daily rec list from service');
    } else {
      throw Exception('Failed to load daily rec list from service');
    }
  }
}
