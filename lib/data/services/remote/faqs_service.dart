import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';

import '../../../utils/constants/endpoints_constants.dart';
import '../../models/remote/response/faqs_model.dart';
import 'base_network_service.dart';

class FaqsService {
  final endpoint = EndpointsConstants.faqs;

  Future<FaqsResponse> getFaqs() async {
    final response = await BaseNetwork.instance.getDio().get(endpoint);

    if (response.statusCode.isSuccess) {
      return FaqsResponse.fromJson(response.data);
    } else if (response.statusCode.isFailure) {
      throw Exception('Failed to load faqs from service');
    } else {
      throw Exception('Failed to load faqs from service');
    }
  }
}
