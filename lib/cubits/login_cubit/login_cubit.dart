import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(LoginCubitInitial(isObsecure: true));

  bool isObsecure = true;

  void isObsecureToggle() {
    isObsecure = !isObsecure;
    emit(LoginCubitInitial(isObsecure: isObsecure));
  }

  // void goToSignUp(context) {
  //   // context.go('/sign_up');
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => BlocProvider(
  //         create: (context) => SignupCubit(),
  //         child: SignUp(),
  //       ),
  //     ),
  //   );
  // }
}
