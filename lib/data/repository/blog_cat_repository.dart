import '../contractor/blog_cat_contractor.dart';
import '../models/remote/response/blog_cat_model.dart';
import '../services/remote/blog_cat_service.dart';

class BlogCatRepository implements BlogCatContractor {
  BlogCatRepository(this._blogCatService);

  final BlogCatService _blogCatService;

  @override
  Future<BlogCatResponse> getBlogCat() {
    return _blogCatService.getBlogCat();
  }
}
