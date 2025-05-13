import 'package:burla_xatun/data/contractor/forum_category_contractor.dart';
import 'package:burla_xatun/data/models/remote/response/forum_category_response.dart';
import 'package:burla_xatun/data/services/remote/forum_category_service.dart';

class ForumCategoryRepository implements ForumCategoryContractor {
  ForumCategoryRepository(this._categoryService);

  final ForumCategoryService _categoryService;

  @override
  Future<List<ForumCategoryResponse>> getForumCategory() {
    return _categoryService.getForumCategory();
  }
}
