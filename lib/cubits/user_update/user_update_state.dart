part of 'user_update_cubit.dart';

enum UserUpdateStatus { initial, loading, success, failure, networkError }

final class UserUpdateState extends Equatable {
  const UserUpdateState({
    required this.status,
    this.message = '',
  });

  final UserUpdateStatus status;
  final String message;

  UserUpdateState copyWith({
    UserUpdateStatus? status,
    String? message,
  }) {
    return UserUpdateState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, message];
}
