import '../contractor/change_pass_contractor.dart';
import '../services/remote/change_pass_service.dart';

class ChangePassRepository implements ChangePassContractor {
  ChangePassRepository(this._changePassService);

  final ChangePassService _changePassService;

  @override
  Future<bool> changePass({
    required String oldPassword,
    required String newPassword1,
    required String newPassword2,
  }) {
    return _changePassService.changePassword(
      oldPassword: oldPassword,
      newPassword1: newPassword1,
      newPassword2: newPassword2,
    );
  }
}
