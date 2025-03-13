import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/services/local/token_hive_service.dart';
import '../../data/services/local/user_hive_service.dart';
import '../../data/services/remote/auth_service.dart';
import 'login_cubit_state.dart';

enum LoginStatus { initial, loading, success, error }

class LoginCubit extends Cubit<LoginCubitInitial> {
  LoginCubit() : super(LoginCubitInitial());


  final loginEmailFocusNode = FocusNode();
  final loginPasswordFocusNode = FocusNode();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();

  void isObsecureToggle() {
    emit(state.copyWith(isObsecure: !state.isObsecure));
  }

  void updateIsValid() {
    final isActiveButton = loginEmailController.text.isNotEmpty &&
        loginPasswordController.text.isNotEmpty;
    emit(state.copyWith(isActiveButton: isActiveButton));
  }

  void errorState() {
    emit(state.copyWith(isError: true));
  }

  void login() async {
    try {
      emit(state.copyWith(loginStatus: LoginStatus.loading, isError: false));
      final token = await authService.login(
          loginEmailController.text, loginPasswordController.text);
      final isSavedToken = await TokenHiveService.instance.saveToken(token);
      if (isSavedToken) {
        final savedToken = await TokenHiveService.instance.getToken();
        final userData = await authService.getUser(savedToken!);
        final data = userData.toHiveModel();
        bool isSuccess = await UserHiveService.instance.saveUserData(data);
        if (isSuccess) {
          emit(state.copyWith(loginStatus: LoginStatus.success));
        }
      }
    } catch (e, s) {
      emit(state.copyWith(loginStatus: LoginStatus.error));
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
