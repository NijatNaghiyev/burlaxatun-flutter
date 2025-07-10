import 'dart:convert';

import 'package:burla_xatun/data/models/remote/response/register_response_model.dart';
import 'package:hive/hive.dart';

class RegisterTokenService {
  RegisterTokenService(this._box);

  final Box<String> _box;

  Future<void> saveLoginResponse(RegisterResponseModel response) async {
    _box.put('register', jsonEncode(response.toJson()));
  }

  RegisterResponseModel? get registerResponse {
    try {
      String? registerResponse = _box.get('register');
      if (registerResponse == null) return null;
      RegisterResponseModel decodedResponse =
          RegisterResponseModel.fromJson(jsonDecode(registerResponse));
      return decodedResponse;
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteSaveByKey(String key) async {
    await _box.delete(key);
  }

  String? get token => registerResponse?.access;
  
  Future<bool> isUserLoggedIn() async {
    final currentToken = token;
    return currentToken != null && currentToken.isNotEmpty;
  }
}
