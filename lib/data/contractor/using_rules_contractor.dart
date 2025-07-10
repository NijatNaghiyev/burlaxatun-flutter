import '../models/remote/response/using_rules_model.dart';

abstract class UsingRulesContractor {
  Future<UsingRulesResponse> getUsingRules();
}
