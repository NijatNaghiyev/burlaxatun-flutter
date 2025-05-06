import '../models/remote/response/baby_names_model2.dart';

abstract class BabyNamesContractor {
  Future<BabyNamesResponse2> getBabyNames();

  Future<BabyNamesResponse2> getBabyNamesByCountryId(String countryId);
}
