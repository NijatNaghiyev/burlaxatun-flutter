import 'dart:developer';

import 'package:burla_xatun/data/services/local/user_hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/services/remote/auth_service.dart';

part 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit()
      : super(LoginCubitInitial(isActiveButton: false, isObsecure: true));

  bool isActiveButton = false;
  bool isObsecure = true;
  final loginEmailFocusNode = FocusNode();
  final loginPasswordFocusNode = FocusNode();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();

  void isObsecureToggle() {
    isObsecure = !isObsecure;
    emit(LoginCubitInitial(
        isActiveButton: isActiveButton, isObsecure: isObsecure));
  }

  void updateIsValid() {
    isActiveButton = loginEmailController.text.isNotEmpty &&
        loginPasswordController.text.isNotEmpty;
    emit(LoginCubitInitial(
        isActiveButton: isActiveButton, isObsecure: isObsecure));
  }

  void login() async {
    try {
      emit(LoginCubitLoading());
      final token = await authService.login(
          loginEmailController.text, loginPasswordController.text);
      final userData = await authService.getUser(token);
      final d = userData.toHiveModel();

      bool isSuccess = await UserHiveService.instance.saveUserData(d);
      log('$isSuccess');
      if (isSuccess) {
        emit(LoginCubitSuccess());
      }
    } catch (e, s) {
      emit(LoginCubitError());
      log('error: $e');
      log('Stack Trace: $s');
      throw Exception();
    }
  }

  @override
  Future<void> close() {
    loginEmailFocusNode.dispose();
    loginPasswordFocusNode.dispose();
    loginEmailController.dispose();
    loginPasswordController.dispose();
    return super.close();
  }
}
