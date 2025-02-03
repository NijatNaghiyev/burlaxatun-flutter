import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(LoginCubitInitial(isObsecure: true));

  bool isObsecure = true;
  bool isActiveButton = false;
  final loginEmailFocusNode = FocusNode();
  final loginPasswordFocusNode = FocusNode();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  void isObsecureToggle() {
    isObsecure = !isObsecure;
    emit(LoginCubitInitial(isObsecure: isObsecure));
  }

  // void isActivateButton() {
  //   if (loginEmailController.text.isNotEmpty &&
  //       loginPasswordController.text.isNotEmpty) {
  //     isActiveButton = true;
  //   } else {
  //     isActiveButton = false;
  //   }
  //   emit(LoginCubitInitial(isActiveButton: isActiveButton));
  // }

  @override
  Future<void> close() {
    loginEmailFocusNode.dispose();
    loginPasswordFocusNode.dispose();
    return super.close();
  }
}
