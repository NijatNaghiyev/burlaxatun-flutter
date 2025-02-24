import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../utils/constants/endpoints_constants.dart';
import '../../models/remote/response/login_response_model.dart';
import '../../models/remote/response/user_response_model.dart';
import 'base_network_service.dart';

class AuthService {
  // final Dio _dio = Dio(
  //   BaseOptions(
  //     headers: {
  //       'Authorization': 'Bearer $token',
  //     },
  //   ),
  // )..interceptors.add(PrettyDioLogger(requestHeader: true));

  Future<String> login(String email, String password) async {
    log('REQUEST');
    try {
      final url = EndpointsConstants.login;
      final body = {
        'email': email,
        'password': password,
      };
      final response =
          await BaseNetwork.instance.getDio().post(url, data: body);
      if (response.statusCode == 200) {
        final loginData = LoginResponseModel.fromJson(response.data);
        return loginData.data.token;
      }
      throw Exception('Something has happened while logged in');
    } on DioException catch (e) {
      throw Exception('Dio exception: $e');
    } catch (e, s) {
      log('Error: $e');
      log('Stack Trace: $s');
      throw Exception();
    }
  }

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
