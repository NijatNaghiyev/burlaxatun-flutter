part of 'login_cubit.dart';

@immutable
abstract class LoginCubitState {}

class LoginCubitInitial extends LoginCubitState {
  LoginCubitInitial({
    this.isObsecure = true,
  });

  final bool isObsecure;
}

class LoginCubitLoading extends LoginCubitState {}

class LoginCubitSuccess extends LoginCubitState {}

class LoginCubitError extends LoginCubitState {}
