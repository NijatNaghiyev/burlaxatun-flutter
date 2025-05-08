import '../models/remote/response/countries_model.dart';

abstract class CountriesContractor {
  Future<CountriesResponse> getCountries();
}
