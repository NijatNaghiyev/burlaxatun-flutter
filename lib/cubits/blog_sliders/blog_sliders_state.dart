part of 'blog_sliders_cubit.dart';

enum BlogSlidersStatus { initial, loading, success, failure, networkError }

final class BlogSlidersState extends Equatable {
  const BlogSlidersState({
    required this.status,
    required this.response,
    required this.errorMessage,
  });

  final BlogSlidersStatus status;
  final BlogSlidersResponse? response;
  final String? errorMessage;

  BlogSlidersState copyWith({
    BlogSlidersStatus? status,
    BlogSlidersResponse? response,
    String? errorMessage,
  }) {
    return BlogSlidersState(
      status: status ?? this.status,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory BlogSlidersState.initial() => const BlogSlidersState(
        status: BlogSlidersStatus.initial,
        response: null,
        errorMessage: null,
      );

  @override
  List<Object?> get props => [status, response, errorMessage];
}
