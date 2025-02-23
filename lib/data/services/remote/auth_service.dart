import 'dart:developer';

import 'package:burla_xatun/data/models/remote/response/user_response_model.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../utils/constants/endpoints_constants.dart';
import '../../models/remote/response/login_response_model.dart';

class AuthService {
  final Dio _dio = Dio();

  Future<String> login(String email, String password) async {
    _dio.interceptors.add(PrettyDioLogger());
    log('REQUEST');
    try {
      final url = EndpointsConstants.login;
      final body = {
        'email': email,
        'password': password,
      };
      final response = await _dio.post(url, data: body);
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
      final response = await _dio.get(
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
