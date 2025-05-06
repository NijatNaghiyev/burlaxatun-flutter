import '../contractor/blog_sliders_contractor.dart';
import '../models/remote/response/blog_sliders_model.dart';
import '../services/remote/blog_sliders_service.dart';

class BlogSlidersRepository implements BlogSlidersContractor {
  BlogSlidersRepository(this._blogSlidersService);

  final BlogSlidersService _blogSlidersService;

  @override
  Future<BlogSlidersResponse> getBlogSliders() {
    return _blogSlidersService.getBlogSliders();
  }
}
