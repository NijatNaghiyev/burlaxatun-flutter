part of 'blog_cat_cubit.dart';

enum BlogCatStatus { initial, loading, success, failure, networkError }

final class BlogCatState extends Equatable {
  const BlogCatState({
    required this.status,
    required this.response,
    required this.errorMessage,
  });

  final BlogCatStatus status;
  final BlogCatResponse? response;
  final String? errorMessage;

  BlogCatState copyWith({
    BlogCatStatus? status,
    BlogCatResponse? response,
    String? errorMessage,
  }) {
    return BlogCatState(
      status: status ?? this.status,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory BlogCatState.initial() => const BlogCatState(
        status: BlogCatStatus.initial,
        response: null,
        errorMessage: null,
      );

  @override
  List<Object?> get props => [status, response, errorMessage];
}
