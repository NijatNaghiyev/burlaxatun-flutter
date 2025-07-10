import '../contractor/privacy_policy_contractor.dart';
import '../models/remote/response/privacy_policy_model.dart';
import '../services/remote/privacy_policy_service.dart';

class PrivacyPolicyRepository implements PrivacyPolicyContractor {
  PrivacyPolicyRepository(this._privacyPolicyService);

  final PrivacyPolicyService _privacyPolicyService;

  @override
  Future<PrivacyPolicyResponse> getPrivacyPolicy() {
    return _privacyPolicyService.getPrivacyPolicy();
  }
}
