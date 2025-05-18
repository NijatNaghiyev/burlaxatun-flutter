import 'package:dio/dio.dart';

abstract class DoctorReservContract {
  Future<Response<dynamic>> reserveDoctor({
    required Map<String, dynamic> postData,
  });
}
