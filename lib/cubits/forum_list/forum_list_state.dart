part of 'forum_list_cubit.dart';

sealed class ForumListState {}
//  extends Equatable {
//   const ForumListState();

//   @override
//   List<Object> get props => [];
// }

final class ForumListInitial extends ForumListState {}

final class ForumListLoading extends ForumListState {}

final class ForumListSuccess extends ForumListState {
  ForumListSuccess(this.forumListResponse);

  final ForumListResponse forumListResponse;
}

final class ForumListError extends ForumListState {
  ForumListError(this.message);

  final String message;
}

final class ForumListNetworkError extends ForumListState {
  ForumListNetworkError(this.message);

  final String message;
}
