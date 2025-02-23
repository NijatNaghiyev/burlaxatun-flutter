part of 'login_cubit.dart';

@immutable
class LoginCubitState {}

class LoginCubitInitial extends LoginCubitState {
  LoginCubitInitial({
    required this.isActiveButton,
    required this.isObsecure,
  });

  final bool isActiveButton;
  final bool isObsecure;
}

class LoginCubitLoading extends LoginCubitState {}

class LoginCubitSuccess extends LoginCubitState {}

class LoginCubitError extends LoginCubitState {}
