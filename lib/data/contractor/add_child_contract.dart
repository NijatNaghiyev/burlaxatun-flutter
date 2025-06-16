import 'package:dio/dio.dart';

abstract class AddChildContract {
  Future<Response<dynamic>> addChild({
    Map<String, dynamic>? postData,
  });
}
