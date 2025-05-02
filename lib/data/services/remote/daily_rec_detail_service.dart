import 'package:burla_xatun/data/services/remote/base_network_service.dart';
import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';

import '../../../utils/constants/endpoints_constants.dart';
import '../../models/remote/response/daily_rec_detail_model.dart';

class DailyRecDetailService {
  final endpoint = EndpointsConstants.dailyRecDetail;

  Future<DailyRecDetailResponse> getDailyRecDetail(
      {required String slug}) async {
    final url = endpoint.replaceFirst('{slug}', slug);

    final response = await BaseNetwork.instance.getDio().get(url);

    if (response.statusCode.isSuccess) {
      return DailyRecDetailResponse.fromJson(response.data);
    } else if (response.statusCode.isFailure) {
      throw Exception('Failed to load daily rec detail from service');
    } else {
      throw Exception('Failed to load daily rec detail from service');
    }
  }
}
