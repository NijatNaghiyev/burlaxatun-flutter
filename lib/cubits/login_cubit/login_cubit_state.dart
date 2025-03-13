import 'package:burla_xatun/cubits/login_cubit/login_cubit.dart';
import 'package:equatable/equatable.dart';

class LoginCubitInitial extends Equatable {
  const LoginCubitInitial({
    this.isActiveButton = false,
    this.isObsecure = true,
    this.isError = false,
    this.loginStatus = LoginStatus.initial,
  });

  
  final bool isActiveButton;
  final bool isObsecure;
  final bool isError;
  final LoginStatus loginStatus;

  @override
  List<Object?> get props => [
        isActiveButton,
        isObsecure,
        isError,
        loginStatus,
      ];

  LoginCubitInitial copyWith({
    bool? isActiveButton,
    bool? isObsecure,
    bool? isError,
    LoginStatus? loginStatus,
  }) {
    return LoginCubitInitial(
      isActiveButton: isActiveButton ?? this.isActiveButton,
      isObsecure: isObsecure ?? this.isObsecure,
      isError: isError ?? this.isError,
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }
}
