import 'dart:developer';
import 'package:burla_xatun/data/models/remote/response/register_response_model.dart';
import 'package:dio/dio.dart';
import '../../../utils/constants/endpoints_constants.dart';
import '../../models/remote/response/user_response_model.dart';
import 'base_network_service.dart';

class AuthService {
  Future<UserData> getUser(String token) async {
    try {
      final url = EndpointsConstants.users;
      final headers = {
        'Authorization': 'Bearer $token',
      };
      final response = await BaseNetwork.instance.getDio().get(
            url,
            options: Options(headers: headers),
          );
      if (response.statusCode == 200) {
        final userData = UserResponseModel.fromJson(response.data);
        return userData.data;
      } else {
        throw Exception();
      }
    } catch (e, s) {
      log('Error: $e');
      log('Stack Trace: $s');
      throw Exception();
    }
  }

}
