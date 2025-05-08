part of 'user_update_cubit.dart';

sealed class UserUpdateState {}
// extends Equatable {
//   const UserUpdateState();

//   @override
//   List<Object> get props => [];
// }

final class UserUpdateInitial extends UserUpdateState {}

final class UserUpdateLoading extends UserUpdateState {}

final class UserUpdateSuccess extends UserUpdateState {
  UserUpdateSuccess(this.response);
  final UserUpdateModel response;
}

final class UserUpdateError extends UserUpdateState {
  UserUpdateError(this.message);
  final String message;
}

final class UserUpdateNetworkError extends UserUpdateState {
  UserUpdateNetworkError(this.message);
  final String message;
}
