abstract class ChangePassContractor {
  Future<bool> changePass({
    required String oldPassword,
    required String newPassword1,
    required String newPassword2,
  });
}
