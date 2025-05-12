import '../models/remote/response/blog_sliders_model.dart';

abstract class BlogSlidersContractor {
  Future<BlogSlidersResponse> getBlogSliders();
}
