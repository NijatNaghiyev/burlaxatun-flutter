import 'package:burla_xatun/data/services/remote/base_network_service.dart';
import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';

import '../../../utils/constants/endpoints_constants.dart';
import '../../models/remote/response/doctor_detail_model.dart';

class DoctorDetailService {
  final endpoint = EndpointsConstants.doctorDetail;

  Future<DoctorDetailResponse> getDoctorDetail({required String slug}) async {
    final url = endpoint.replaceFirst('{slug}', slug);

    final response = await BaseNetwork.instance.getDio().get(url);

    if (response.statusCode.isSuccess) {
      return DoctorDetailResponse.fromJson(response.data);
    } else if (response.statusCode.isFailure) {
      throw Exception('Failed to load doctor detail from service');
    } else {
      throw Exception('Unknown error occurred while loading doctor detail');
    }
  }
}
