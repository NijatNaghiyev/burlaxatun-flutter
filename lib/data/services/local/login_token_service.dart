import 'dart:convert';

import 'package:burla_xatun/data/models/remote/response/login_response_model.dart';
import 'package:hive/hive.dart';

class LoginTokenService {
  LoginTokenService(this._box);

  final Box<String> _box;

  Future<void> saveLoginResponse(LoginResponseModel response) async {
    _box.put('login', jsonEncode(response.toJson()));
  }

  LoginResponseModel? get loginResponse {
    try {
      String? loginResponse = _box.get('login');
      if (loginResponse == null) return null;
      LoginResponseModel decodedResponse =
          LoginResponseModel.fromJson(jsonDecode(loginResponse));
      return decodedResponse;
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteSaveByKey(String key) async {
    await _box.delete(key);
  }

  String? get token => loginResponse?.access;
  
  Future<bool> isUserLoggedIn() async {
    final currentToken = token;
    return currentToken != null && currentToken.isNotEmpty;
  }
}
