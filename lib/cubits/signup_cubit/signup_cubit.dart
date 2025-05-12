import 'dart:developer';

import 'package:burla_xatun/data/contractor/register_contractor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._contractor)
      : super(SignupInitial(isChecked: false, isActiveButton: false));

  final RegisterContractor _contractor;

  bool isActiveButton = false;
  bool isChecked = false;
  bool emailValidity = false;
  // String fullName = '';
  // String name = '';
  // String surname = '';
  // String fatherName = '';
  // List<String> fullNameParts = [];
  // final AuthService authService = AuthService();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final signFullNameFocusNode = FocusNode();
  final signUpEmailFocusNode = FocusNode();
  final signUpPasswordFocusNode = FocusNode();

  void checkBoxToggle(bool v) {
    isChecked = v;
    emit(SignupInitial(
      isActiveButton: isActiveButton,
      isChecked: isChecked,
    ));
  }

  // void splitFullName() {
  //   fullName = signFullNameController.text;
  //   if (fullName.contains(' ')) {
  //     fullNameParts = fullName.split(' ');
  //   }

  //   if (fullNameParts.length == 3) {
  //     name = fullNameParts[0].trim();
  //     surname = fullNameParts[1].trim();
  //     fatherName = fullNameParts[2].trim();
  //   }
  // }

  void checkEmailValidity() {
    emailValidity = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);

    log('$emailValidity');
  }

  void updateIsValid() {
    // splitFullName();
    checkEmailValidity();
    isActiveButton = emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        fullNameController.text.isNotEmpty &&
        isChecked &&

        // fullNameParts.length == 3 &&
        emailValidity;
    emit(SignupInitial(
      isActiveButton: isActiveButton,
      isChecked: isChecked,
    ));
  }

  Future<void> register() async {
    try {
      emit(SignupLoading());
      log('Register loading');

      final response = await _contractor.register(
        fullName: fullNameController.text,
        email: emailController.text,
        password: passwordController.text,
      );

      if (response) {
        emit(SignupSuccess());
        log("Register success");
        return;
      }

      // final token = await authService.register(
      //   name,
      //   surname,
      //   fatherName,
      //   signUpEmailController.text,
      //   signUpPasswordController.text,
      // );
      // final isSavedToken = await TokenHiveService.instance.saveToken(token);
      // log('$isSavedToken');
      // if (isSavedToken) {
      //   emit(SignupCubitSuccess());
      // }
    } on DioException catch (e, s) {
      emit(SignupNetworkError(e.toString()));

      log("Register Dio Exception: $e", stackTrace: s);
    } catch (e, s) {
      emit(SignupError(e.toString()));

      log("Register Unknown Error: $e", stackTrace: s);
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    fullNameController.dispose();
    passwordController.dispose();
    signUpEmailFocusNode.dispose();
    signUpPasswordFocusNode.dispose();
    signFullNameFocusNode.dispose();
    return super.close();
  }
}
