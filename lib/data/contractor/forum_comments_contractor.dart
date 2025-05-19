import '../models/remote/response/forum_comments_model.dart';

abstract class ForumCommentsContractor {
  Future<ForumCommentsResponse> getForumComments();
}
