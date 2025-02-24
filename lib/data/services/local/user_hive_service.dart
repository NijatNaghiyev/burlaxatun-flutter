import 'dart:developer';

import 'package:hive/hive.dart';

import '../../models/local/user_data_model.dart';

class UserHiveService {
  UserHiveService._();

  static UserHiveService? _instance;

  static UserHiveService get instance => _instance ??= UserHiveService._();

  Box<UserDataModel>? _userBox;

  Future<Box<UserDataModel>> initBox() async =>
      _userBox ??= await Hive.openBox<UserDataModel>('userBox');

  Future<bool> saveUserData(UserDataModel user) async {
    try {
      await initBox();
      await _userBox!.put('user', user);
      return true;
    } catch (e) {
      log('hive error: $e');
      return false;
    }
  }

  Future<UserDataModel?> getUser() async {
    await initBox();
    UserDataModel? user = _userBox!.get('user');
    if (user == null) {
      return null;
    }
    return user;
  }
}
