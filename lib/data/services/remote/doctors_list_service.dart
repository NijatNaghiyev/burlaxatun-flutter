import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';

import '../../../utils/constants/endpoints_constants.dart';
import '../../models/remote/response/doctors_list_model.dart';
import 'base_network_service.dart';

class DoctorsListService {
  final endpoint = EndpointsConstants.doctorsList;

  Future<DoctorsListResponse> getDoctorsList() async {
    final response = await BaseNetwork.instance.getDio().get(endpoint);

    if (response.statusCode.isSuccess) {
      return DoctorsListResponse.fromJson(response.data);
    } else if (response.statusCode.isFailure) {
      throw Exception('Failed to load Doctors List data from service');
    } else {
      throw Exception('Failed to load Doctors List data from service');
    }
  }
}
