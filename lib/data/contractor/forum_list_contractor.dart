import 'package:burla_xatun/data/models/remote/response/forum_list_response.dart';

abstract class ForumListContractor {
  Future<ForumListResponse> getForumList({String? categoryId});
}
