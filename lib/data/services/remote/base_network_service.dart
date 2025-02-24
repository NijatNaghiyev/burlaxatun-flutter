import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart' show PrettyDioLogger;

class BaseNetwork {
  BaseNetwork._();

  static BaseNetwork? _instance;

  static BaseNetwork get instance => _instance ??= BaseNetwork._();

  Dio? _dio;

  Dio getDio({String? token}) => _dio ??= Dio(
        BaseOptions(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      )..interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
          ),
        );
}
