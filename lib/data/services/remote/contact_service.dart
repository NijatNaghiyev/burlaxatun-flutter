import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';

import '../../../utils/constants/endpoints_constants.dart';
import '../../models/remote/response/contact_model.dart';
import 'base_network_service.dart';

class ContactService {
  final endpoint = EndpointsConstants.contact;

  Future<ContactResponse> getContact() async {
    final response = await BaseNetwork.instance.getDio().get(endpoint);

    if (response.statusCode.isSuccess) {
      return ContactResponse.fromJson(response.data);
    } else if (response.statusCode.isFailure) {
      throw Exception('Failed to load Contact data from service');
    } else {
      throw Exception('Failed to load Contact data from service');
    }
  }
}
