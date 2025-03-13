import 'dart:developer';

import 'package:burla_xatun/data/services/local/token_hive_service.dart';
import 'package:burla_xatun/data/services/remote/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupCubitState> {
  SignupCubit()
      : super(SignupCubitInitial(
          isChecked: false,
          isActiveButton: false,
        ));

  bool isActiveButton = false;
  bool isChecked = false;
  bool emailValidity = false;
  String fullName = '';
  String name = '';
  String surname = '';
  String fatherName = '';
  List<String> fullNameParts = [];
  final AuthService authService = AuthService();
  final signFullNameController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final signUpPasswordController = TextEditingController();

  final signFullNameFocusNode = FocusNode();
  final signUpEmailFocusNode = FocusNode();
  final signUpPasswordFocusNode = FocusNode();

  void checkBoxToggle(bool v) {
    isChecked = v;
    emit(SignupCubitInitial(
      isActiveButton: isActiveButton,
      isChecked: isChecked,
    ));
  }

  void splitFullName() {
    fullName = signFullNameController.text;
    if (fullName.contains(' ')) {
      fullNameParts = fullName.split(' ');
    }

    if (fullNameParts.length == 3) {
      name = fullNameParts[0].trim();
      surname = fullNameParts[1].trim();
      fatherName = fullNameParts[2].trim();
    }
  }

  void checkEmailValidity() {
    emailValidity = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(signUpEmailController.text);

    log('$emailValidity');
  }

  void updateIsValid() {
    splitFullName();
    checkEmailValidity();
    isActiveButton = signUpEmailController.text.isNotEmpty &&
        signUpPasswordController.text.isNotEmpty &&
        signFullNameController.text.isNotEmpty &&
        fullNameParts.length == 3 &&
        emailValidity;
    emit(SignupCubitInitial(
      isActiveButton: isActiveButton,
      isChecked: isChecked,
    ));
  }

  Future<void> register() async {
    emit(SignupCubitLoading());
    try {
      log('register button clicked');
      final token = await authService.register(
        name,
        surname,
        fatherName,
        signUpEmailController.text,
        signUpPasswordController.text,
      );
      final isSavedToken = await TokenHiveService.instance.saveToken(token);
      log('$isSavedToken');
      if (isSavedToken) {
        emit(SignupCubitSuccess());
      }
    } catch (e) {
      emit(SignupCubitError());
      throw Exception('$e');
    }
  }

  @override
  Future<void> close() {
    signUpEmailController.dispose();
    signFullNameController.dispose();
    signUpPasswordController.dispose();
    signUpEmailFocusNode.dispose();
    signUpPasswordFocusNode.dispose();
    signFullNameFocusNode.dispose();
    return super.close();
  }
}
