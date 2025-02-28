part of 'signup_cubit.dart';

@immutable
abstract class SignupCubitState {}

class SignupCubitInitial extends SignupCubitState {
  SignupCubitInitial({
    required this.isChecked,
    required this.isActiveButton,
  });

  final bool isChecked;
  final bool isActiveButton;
}

class SignupCubitLoading extends SignupCubitState {}

class SignupCubitSuccess extends SignupCubitState {}

class SignupCubitError extends SignupCubitState {}
