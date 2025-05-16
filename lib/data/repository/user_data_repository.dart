import 'package:burla_xatun/data/models/remote/response/user_data_model.dart';

import '../contractor/user_data_contractor.dart';
import '../services/remote/user_data_service.dart';

class UserDataRepository implements UserDataContractor {
  UserDataRepository(this._userDataService);

  final UserDataService _userDataService;

  @override
  Future<UserDataResponse> getUserData() {
    return _userDataService.getUserData();
  }
}
