part of 'forum_create_cubit.dart';

enum ForumCreateStatus { initial, loading, success, failure, networkError }

final class ForumCreateState extends Equatable {
  const ForumCreateState({
    required this.status,
    this.message = '',
  });

  final ForumCreateStatus status;
  final String message;

  ForumCreateState copyWith({
    ForumCreateStatus? status,
    String? message,
  }) {
    return ForumCreateState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, message];
}
