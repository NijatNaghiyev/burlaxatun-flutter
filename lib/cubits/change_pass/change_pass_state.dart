part of 'change_pass_cubit.dart';

enum ChangePassStatus { initial, loading, success, failure, networkError }

final class ChangePassState extends Equatable {
  const ChangePassState({
    required this.status,
    this.message = '',
  });

  final ChangePassStatus status;
  final String message;

  ChangePassState copyWith({
    ChangePassStatus? status,
    String? message,
  }) {
    return ChangePassState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, message];
}
