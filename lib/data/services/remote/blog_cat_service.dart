import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';

import '../../../utils/constants/endpoints_constants.dart';
import '../../models/remote/response/blog_cat_model.dart';
import 'base_network_service.dart';

class BlogCatService {
  final endpoint = EndpointsConstants.blogCategories;

  Future<BlogCatResponse> getBlogCat() async {
    final response = await BaseNetwork.instance.getDio().get(endpoint);

    if (response.statusCode.isSuccess) {
      return BlogCatResponse.fromJson(response.data);
    } else if (response.statusCode.isFailure) {
      throw Exception('Failed to load Blog Cat data from service');
    } else {
      throw Exception('Failed to load Blog Cat data from service');
    }
  }
}
