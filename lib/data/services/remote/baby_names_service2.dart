import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';

import '../../../utils/constants/endpoints_constants.dart';
import '../../models/remote/response/baby_names_model2.dart';
import 'base_network_service.dart';

class BabyNamesService {
  final endpoint = EndpointsConstants.babyNames;

  Future<BabyNamesResponse2> getBabyNames() async {
    final response = await BaseNetwork.instance.getDio().get(endpoint);

    if (response.statusCode.isSuccess) {
      return BabyNamesResponse2.fromJson(response.data);
    } else if (response.statusCode.isFailure) {
      throw Exception('Failed to load Baby Names data from service');
    } else {
      throw Exception('Failed to load Baby Names data from service');
    }
  }

  Future<BabyNamesResponse2> getBabyNamesByCountryId(String countryId) async {
    final response = await BaseNetwork.instance.getDio().get(
      endpoint,
      queryParameters: {'country': countryId},
    );

    if (response.statusCode.isSuccess) {
      return BabyNamesResponse2.fromJson(response.data);
    } else if (response.statusCode.isFailure) {
      throw Exception('Failed to load Baby Names data for country $countryId');
    } else {
      throw Exception('Failed to load Baby Names data for country $countryId');
    }
  }
}
