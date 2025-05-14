import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart' show PrettyDioLogger;

class BaseNetwork {
  BaseNetwork._();

  static BaseNetwork? _instance;

  static BaseNetwork get instance => _instance ??= BaseNetwork._();

  Dio? _dio;

  /// Get
  Dio getDio({String? token}) {
    log('authorization token is this: $token');
    _dio ??= Dio()
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
      );

    if (token != null) {
      _dio!.options.headers['Authorization'] = 'Bearer $token';
    }

    return _dio!;
  }

  /// Post
  Future<Response> post({
    required String path,
    required dynamic postData,
    Options? options,
  }) async {
    final dio = getDio();
    return await dio.post(path, data: postData, options: options);
  }

  /// PATCH
  Future<Response> patch({
    required String path,
    required dynamic postData,
    Options? options,
  }) async {
    final dio = getDio();
    return await dio.patch(path, data: postData, options: options);
  }
}
