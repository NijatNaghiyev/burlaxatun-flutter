import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';

import '../../../utils/constants/endpoints_constants.dart';
import '../../models/remote/response/blog_sliders_model.dart';
import 'base_network_service.dart';

class BlogSlidersService {
  final endpoint = EndpointsConstants.blogSliders;

  Future<BlogSlidersResponse> getBlogSliders() async {
    final response = await BaseNetwork.instance.getDio().get(endpoint);

    if (response.statusCode.isSuccess) {
      return BlogSlidersResponse.fromJson(response.data);
    } else if (response.statusCode.isFailure) {
      throw Exception('Failed to load Blog Sliders data from service');
    } else {
      throw Exception('Failed to load Blog Sliders data from service');
    }
  }
}
