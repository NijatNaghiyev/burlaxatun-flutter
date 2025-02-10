import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupCubitState> {
  SignupCubit() : super(SignupCubitInitial(false));

  bool isActiveButton = false;
  bool isChecked = false;
  final signUpEmailController = TextEditingController();
  final signUpPasswordController = TextEditingController();
  final signUpConfirmPasswordController = TextEditingController();

  final signUpEmailFocusNode = FocusNode();
  final signUpPasswordFocusNode = FocusNode();
  final signUpConfirmPasswordFocusNode = FocusNode();

  void checkBoxToggle(bool v) {
    emit(SignupCubitInitial(v));
  }

  void updateIsValid() {
    isActiveButton = signUpEmailController.text.isNotEmpty &&
        signUpPasswordController.text.isNotEmpty &&
        signUpConfirmPasswordController.text.isNotEmpty;
  }

  @override
  Future<void> close() {
    signUpEmailFocusNode.dispose();
    signUpPasswordFocusNode.dispose();
    signUpConfirmPasswordFocusNode.dispose();
    return super.close();
  }
}
