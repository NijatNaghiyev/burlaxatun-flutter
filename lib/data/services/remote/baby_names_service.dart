import 'package:burla_xatun/data/models/remote/response/country_names_model.dart';
import 'package:burla_xatun/data/models/remote/response/names_model.dart';
import 'package:burla_xatun/data/models/remote/response/selected_names_model.dart';
import 'package:burla_xatun/data/services/local/token_hive_service.dart';
import 'package:burla_xatun/data/services/remote/base_network_service.dart';
import 'package:burla_xatun/utils/constants/endpoints_constants.dart';

class BabyNamesService {
  Future<List<CountryData>> getCountries() async {
    final token = await TokenHiveService.instance.getToken();
    final url = EndpointsConstants.countries;

    final response = await BaseNetwork.instance.getDio(token: token).get(url);

    if (response.statusCode == 200) {
      final countriesData = CountryNamesModel.fromJson(response.data);
      return countriesData.data;
    }
    throw Exception('Something has happened while fetching countries data');
  }

  Future<NamesData> getGenderNames(String countryId) async {
    final token = await TokenHiveService.instance.getToken();
    final url = EndpointsConstants.names;
    final body = {
      "id": countryId,
      "limit": 10,
      "start": 0,
    };

    final response =
        await BaseNetwork.instance.getDio(token: token).post(url, data: body);

    if (response.statusCode == 200) {
      final namesData = NamesModel.fromJson(response.data);
      return namesData.data;
    }
    throw Exception('Something has happened while fetching names');
  }

  Future<List<SelectedNameData>> getSelectedNames() async {
    final token = await TokenHiveService.instance.getToken();
    final url = EndpointsConstants.selectedNames;

    final response = await BaseNetwork.instance.getDio(token: token).get(url);

    if (response.statusCode == 200) {
      final selectedNames = SelectedNamesModel.fromJson(response.data).data;
      return selectedNames;
    }
    throw Exception('Something has happened while fetching selected names');
  }

  Future<bool> selectName(String nameId) async {
    final token = await TokenHiveService.instance.getToken();
    final url = EndpointsConstants.selectedNames;
    final body = {
      "name_id": nameId,
    };

    final response =
        await BaseNetwork.instance.getDio(token: token).post(url, data: body);

    return response.statusCode == 200;
  }
}
