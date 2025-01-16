import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui/screens/auth/sign_up/signup.dart';
import '../signup_cubit/signup_cubit.dart';

part 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(LoginCubitInitial(isObsecure: true));

  bool isObsecure = true;

  void isObsecureToggle() {
    log('message');
    isObsecure = !isObsecure;
    emit(LoginCubitInitial(isObsecure: isObsecure));
  }

  void goToSignUp(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => SignupCubit(),
          child: SignUp(),
        ),
      ),
    );
  }
}
