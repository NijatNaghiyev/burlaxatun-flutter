import '../contractor/baby_names_contractor2.dart';
import '../models/remote/response/baby_names_model2.dart';
import '../services/remote/baby_names_service2.dart';

class BabyNamesRepository implements BabyNamesContractor {
  BabyNamesRepository(this._babyNamesService);

  final BabyNamesService _babyNamesService;

  @override
  Future<BabyNamesResponse2> getBabyNames() {
    return _babyNamesService.getBabyNames();
  }

  @override
  Future<BabyNamesResponse2> getBabyNamesByCountryId(String countryId) {
    return _babyNamesService.getBabyNamesByCountryId(countryId);
  }
}
