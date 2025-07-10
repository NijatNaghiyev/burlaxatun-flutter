import '../models/remote/response/blog_cat_model.dart';

abstract class BlogCatContractor {
  Future<BlogCatResponse> getBlogCat();
}
