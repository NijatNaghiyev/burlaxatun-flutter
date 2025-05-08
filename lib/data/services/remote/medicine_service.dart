import 'package:burla_xatun/data/services/local/login_token_service.dart';
import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';

import '../../../utils/constants/endpoints_constants.dart';
import '../../../utils/di/locator.dart';
import '../../models/remote/response/medicines_model.dart';
import 'base_network_service.dart';

class MedicineService {
  final endpoint = EndpointsConstants.medicines;

  Future<MedicineResponse> getMedicines() async {
    final token = locator<LoginTokenService>().token;
    if (token == null) {
      throw Exception("Token is null. Please login first.");
    }

    final response =
        await BaseNetwork.instance.getDio(token: token).get(endpoint);

    // final response = await dio.get(endpoint);

    if (response.statusCode.isSuccess) {
      return MedicineResponse.fromJson(response.data);
    } else {
      throw Exception('Failed to load Medicine data from service');
    }
  }
}
