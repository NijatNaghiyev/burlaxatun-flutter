import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';

import '../../../utils/constants/endpoints_constants.dart';
import '../../models/remote/response/about_model.dart';
import 'base_network_service.dart';

class AboutService {
  final endpoint = EndpointsConstants.about;

  Future<AboutResponse> getAbout() async {
    final response = await BaseNetwork.instance.getDio().get(endpoint);

    if (response.statusCode.isSuccess) {
      return AboutResponse.fromJson(response.data);
    } else if (response.statusCode.isFailure) {
      throw Exception('Failed to load About data from service');
    } else {
      throw Exception('Failed to load About data from service');
    }
  }
}
