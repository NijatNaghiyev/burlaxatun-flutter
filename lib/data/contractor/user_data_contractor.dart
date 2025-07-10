import '../models/remote/response/user_data_model.dart';

abstract class UserDataContractor {
  Future<UserDataResponse> getUserData();
}
