import 'package:burla_xatun/data/models/remote/response/forum_category_response.dart';

abstract class ForumCategoryContractor {
  Future<List<ForumCategoryResponse>> getForumCategory();
}
