part of 'login_cubit.dart';

@immutable
abstract class LoginCubitState {}

class LoginCubitInitial extends LoginCubitState {
  LoginCubitInitial({
    this.isObsecure,
    this.isActiveButton,
  });

  final bool? isObsecure;
  final bool? isActiveButton;
}

class LoginCubitLoading extends LoginCubitState {}

class LoginCubitSuccess extends LoginCubitState {}

class LoginCubitError extends LoginCubitState {}
