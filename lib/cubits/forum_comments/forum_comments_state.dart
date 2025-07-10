part of 'forum_comments_cubit.dart';

enum ForumCommentsStatus { initial, loading, success, failure, networkError }

final class ForumCommentsState extends Equatable {
  const ForumCommentsState({
    required this.status,
    required this.response,
    required this.errorMessage,
  });

  final ForumCommentsStatus status;
  final ForumCommentsResponse? response;
  final String? errorMessage;

  ForumCommentsState copyWith({
    ForumCommentsStatus? status,
    ForumCommentsResponse? response,
    String? errorMessage,
  }) {
    return ForumCommentsState(
      status: status ?? this.status,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory ForumCommentsState.initial() => const ForumCommentsState(
        status: ForumCommentsStatus.initial,
        response: null,
        errorMessage: null,
      );

  @override
  List<Object?> get props => [status, response, errorMessage];
}
