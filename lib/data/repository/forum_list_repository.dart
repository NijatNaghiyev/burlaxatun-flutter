import 'package:burla_xatun/data/contractor/forum_list_contractor.dart';
import 'package:burla_xatun/data/models/remote/response/forum_list_response.dart';
import 'package:burla_xatun/data/services/remote/forum_list_service.dart';

class ForumListRepository implements ForumListContractor {
  ForumListRepository(this._forumListService);

  final ForumListService _forumListService;
  @override
  Future<ForumListResponse> getForumList({String? categoryId}) {
    return _forumListService.getForumList(categoryId: categoryId);
  }
}
