import 'package:burla_xatun/cubits/login_cubit/login_cubit.dart';
import 'package:equatable/equatable.dart';

class LoginCubitInitial extends Equatable {
  const LoginCubitInitial({
    this.isActiveButton = false,
    this.isObsecure = true,
    this.isError = false,
    this.loginStatus = LoginStatus.initial,
    this.errorMessage,
  });

  final bool isActiveButton;
  final bool isObsecure;
  final bool isError;
  final LoginStatus loginStatus;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        isActiveButton,
        isObsecure,
        isError,
        loginStatus,
        errorMessage,
      ];

  LoginCubitInitial copyWith({
    bool? isActiveButton,
    bool? isObsecure,
    bool? isError,
    LoginStatus? loginStatus,
    String? errorMessage,
  }) {
    return LoginCubitInitial(
      isActiveButton: isActiveButton ?? this.isActiveButton,
      isObsecure: isObsecure ?? this.isObsecure,
      isError: isError ?? this.isError,
      loginStatus: loginStatus ?? this.loginStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
