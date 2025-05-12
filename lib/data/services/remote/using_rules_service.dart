import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';

import '../../../utils/constants/endpoints_constants.dart';
import '../../models/remote/response/using_rules_model.dart';
import 'base_network_service.dart';

class UsingRulesService {
  final endpoint = EndpointsConstants.usingRules;

  Future<UsingRulesResponse> getUsingRules() async {
    final response = await BaseNetwork.instance.getDio().get(endpoint);

    if (response.statusCode.isSuccess) {
      return UsingRulesResponse.fromJson(response.data);
    } else if (response.statusCode.isFailure) {
      throw Exception('Failed to load Using Rules from service');
    } else {
      throw Exception('Failed to load Using Rules from service');
    }
  }
}
