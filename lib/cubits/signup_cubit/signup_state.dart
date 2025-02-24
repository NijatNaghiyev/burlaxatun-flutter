part of 'signup_cubit.dart';

@immutable
abstract class SignupCubitState {}

class SignupCubitInitial extends SignupCubitState {
  SignupCubitInitial(this.isChecked);

  final bool isChecked;
}

class SignupCubitLoading extends SignupCubitState {}

class SignupCubitSuccess extends SignupCubitState {}

class SignupCubitError extends SignupCubitState {}
