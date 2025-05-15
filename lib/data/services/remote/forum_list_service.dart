import 'package:burla_xatun/data/models/remote/response/forum_list_response.dart';
import 'package:burla_xatun/data/services/remote/base_network_service.dart';
import 'package:burla_xatun/utils/constants/endpoints_constants.dart';
import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';

class ForumListService {
  Future<ForumListResponse> getForumList({String? categoryId}) async {
    // final endpoint = EndpointsConstants.forumList;

    final endpoint = categoryId == null
        ? EndpointsConstants.forumList
        : "${EndpointsConstants.forumList}?category=$categoryId";

    final response = await BaseNetwork.instance.getDio().get(endpoint);

    if (response.statusCode.isSuccess) {
      return ForumListResponse.fromJson(response.data);
    } else if (response.statusCode.isFailure) {
      throw Exception("Failed to load forum list data");
    }
    throw Exception("Unable to get forum list data");
  }
}
