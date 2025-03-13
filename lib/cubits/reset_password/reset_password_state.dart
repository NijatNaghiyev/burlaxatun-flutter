import 'package:equatable/equatable.dart';

import 'reset_password_cubit.dart';

class ResetPasswordInitial extends Equatable {
  const ResetPasswordInitial({
    this.resetPasswordStatus = ResetPasswordStateStatus.initial,
  });

  final ResetPasswordStateStatus resetPasswordStatus;

  @override
  List<Object?> get props => [resetPasswordStatus];

  ResetPasswordInitial copyWith({
    ResetPasswordStateStatus? resetPasswordStateStatus,
  }) {
    return ResetPasswordInitial(
      resetPasswordStatus: resetPasswordStateStatus ?? this.resetPasswordStatus,
    );
  }
}
