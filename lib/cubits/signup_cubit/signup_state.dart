part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {
  SignupInitial({
    required this.isChecked,
    required this.isActiveButton,
  });

  final bool isChecked;
  final bool isActiveButton;
}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {}

class SignupError extends SignupState {
  SignupError(this.error);
  final String error;
}

class SignupNetworkError extends SignupState {
  SignupNetworkError(this.error);
  final String error;
}
