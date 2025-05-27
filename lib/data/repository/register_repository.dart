import 'package:burla_xatun/data/contractor/register_contractor.dart';
import 'package:burla_xatun/data/models/remote/response/register_response_model.dart';
import 'package:burla_xatun/data/services/remote/register_service.dart';

class RegisterRepository implements RegisterContractor {
  RegisterRepository(this._registerService);
  final RegisterService _registerService;
  @override
  Future<RegisterResponseModel> register({
    required String fullName,
    required String email,
    required String password,
  }) {
    return _registerService.register(
      fullName: fullName,
      email: email,
      password: password,
    );
  }
}
