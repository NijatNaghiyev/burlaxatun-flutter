part of 'forum_category_cubit.dart';

sealed class ForumCategoryState {}
//  extends Equatable {
//   const ForumCategoryState();

//   @override
//   List<Object> get props => [];
// }

final class ForumCategoryInitial extends ForumCategoryState {}

final class ForumCategoryLoading extends ForumCategoryState {}

final class ForumCategorySuccess extends ForumCategoryState {
  ForumCategorySuccess(this.response);

  final List<ForumCategoryResponse> response;
}

final class ForumCategoryError extends ForumCategoryState {
  ForumCategoryError(this.message);

  final String message;
}

final class ForumCategoryNetworkError extends ForumCategoryState {
  ForumCategoryNetworkError(this.message);

  final String message;
}
