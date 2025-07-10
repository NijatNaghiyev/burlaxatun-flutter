import 'package:burla_xatun/data/models/remote/response/user_data_model.dart';
import 'package:burla_xatun/data/services/local/login_token_service.dart';
import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';

import '../../../../utils/constants/endpoints_constants.dart';
import '../../../../utils/di/locator.dart';
import 'base_network_service.dart';

class UserDataService {
  final endpoint = EndpointsConstants.userData;

  Future<UserDataResponse> getUserData() async {
    final token = locator<LoginTokenService>().token;
    if (token == null) {
      throw Exception("Token is null. Please login first.");
    }

    final response =
        await BaseNetwork.instance.getDio(token: token).get(endpoint);

    if (response.statusCode.isSuccess) {
      return UserDataResponse.fromJson(response.data);
    } else {
      throw Exception('Failed to load User data from service');
    }
  }
}
