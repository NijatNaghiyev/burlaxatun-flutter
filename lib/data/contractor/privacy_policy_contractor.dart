import '../models/remote/response/privacy_policy_model.dart';

abstract class PrivacyPolicyContractor {
  Future<PrivacyPolicyResponse> getPrivacyPolicy();
}
