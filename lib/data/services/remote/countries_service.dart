import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';

import '../../../utils/constants/endpoints_constants.dart';
import '../../models/remote/response/countries_model.dart';
import 'base_network_service.dart';

class CountriesService {
  final endpoint = EndpointsConstants.extraCountries;

  Future<CountriesResponse> getCountries() async {
    final response = await BaseNetwork.instance.getDio().get(endpoint);

    if (response.statusCode.isSuccess) {
      return CountriesResponse.fromJson(response.data);
    } else if (response.statusCode.isFailure) {
      throw Exception('Failed to load Countries data from service');
    } else {
      throw Exception('Failed to load Countries data from service');
    }
  }
}
