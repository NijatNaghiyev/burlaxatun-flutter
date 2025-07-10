import 'package:burla_xatun/data/models/remote/request/add_child_request_model.dart';
import 'package:burla_xatun/data/services/local/login_token_service.dart';
import 'package:burla_xatun/data/services/local/user_hive_service.dart';
import 'package:burla_xatun/data/services/remote/base_network_service.dart';
import 'package:burla_xatun/utils/constants/endpoints_constants.dart';
import 'package:burla_xatun/utils/di/locator.dart';
import 'package:dio/dio.dart';

class AddChildService {
  Future<Response<dynamic>> addChild({
    Map<String, dynamic>? postData,
  }) async {
    const url = EndpointsConstants.babyAdd;

    final token = locator<LoginTokenService>().token;

    final response =
        BaseNetwork.instance.getDio(token: token).post(url, data: postData);

    return response;

    // final postData = {
    //   'name': name,
    //   if (weight != null) 'weight': weight,
    //   if (height != null) 'height': height,
    //   if (birthDate != null) 'birth_date': birthDate,
    //   if (gender != null) 'gender': gender,
    //   if (haveBorn != null) 'have_born': haveBorn,
    //   if (isFirst != null) 'is_first': isFirst,
    //   if (haveMiscarriage != null) 'have_miscarriage': haveMiscarriage,
    // };
  }
}
