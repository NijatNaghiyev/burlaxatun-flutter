import 'package:burla_xatun/data/models/remote/response/register_response_model.dart';

abstract class RegisterContractor {
  Future<RegisterResponseModel> register({
    required String fullName,
    required String email,
    required String password,
  });
}
