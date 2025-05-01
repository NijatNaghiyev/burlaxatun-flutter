abstract class RegisterContractor {
  Future<bool> register({
    required String fullName,
    required String email,
    required String password,
  });
}
