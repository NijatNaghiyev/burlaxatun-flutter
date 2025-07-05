import 'package:dio/dio.dart';

abstract class RefreshTokenContract {
  Future<Response<dynamic>> refreshToken(Map<String, dynamic> refreshToken);
}
