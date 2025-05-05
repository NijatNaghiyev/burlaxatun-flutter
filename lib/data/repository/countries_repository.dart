import '../contractor/countries_contractor.dart';
import '../models/remote/response/countries_model.dart';
import '../services/remote/countries_service.dart';

class CountriesRepository implements CountriesContractor {
  CountriesRepository(this._countriesService);

  final CountriesService _countriesService;

  @override
  Future<CountriesResponse> getCountries() {
    return _countriesService.getCountries();
  }
}
