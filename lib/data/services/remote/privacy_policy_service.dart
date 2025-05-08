import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';

import '../../../utils/constants/endpoints_constants.dart';
import '../../models/remote/response/privacy_policy_model.dart';
import 'base_network_service.dart';

class PrivacyPolicyService {
  final endpoint = EndpointsConstants.privacyPolicy;

  Future<PrivacyPolicyResponse> getPrivacyPolicy() async {
    final response = await BaseNetwork.instance.getDio().get(endpoint);

    if (response.statusCode.isSuccess) {
      return PrivacyPolicyResponse.fromJson(response.data);
    } else if (response.statusCode.isFailure) {
      throw Exception('Failed to load Privacy Policy from service');
    } else {
      throw Exception('Failed to load Privacy Policy from service');
    }
  }
}
