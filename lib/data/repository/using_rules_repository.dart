import '../contractor/using_rules_contractor.dart';
import '../models/remote/response/using_rules_model.dart';
import '../services/remote/using_rules_service.dart';

class UsingRulesRepository implements UsingRulesContractor {
  UsingRulesRepository(this._usingRulesService);

  final UsingRulesService _usingRulesService;

  @override
  Future<UsingRulesResponse> getUsingRules() {
    return _usingRulesService.getUsingRules();
  }
}
