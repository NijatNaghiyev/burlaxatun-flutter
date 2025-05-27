import 'package:dio/dio.dart';

abstract class IndicatorContract {
  Future<Response<dynamic>> getIndicator({
    required int babyId,
    required String indicatorName,
    required String range,
  });
}
