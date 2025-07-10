import 'package:burla_xatun/data/models/remote/response/blog_cat_model.dart';

String getBlogImageHelper(Blog blog) {
  final videoExtensions = ['.mp4', '.mov', '.avi', '.mkv'];
  final file = blog.file?.toLowerCase() ?? '';

  final isVideo = videoExtensions.any((ext) => file.endsWith(ext));
  return isVideo ? (blog.thumbnail ?? '') : (blog.file ?? '');
}
