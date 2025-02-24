import 'dart:developer';

import 'package:burla_xatun/data/services/local/token_hive_service.dart';
import 'package:burla_xatun/data/services/remote/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupCubitState> {
  SignupCubit() : super(SignupCubitInitial(false));

  bool isActiveButton = false;
  bool isChecked = false;
  String fullName = '';
  final AuthService authService = AuthService();
  final signFullNameController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final signUpPasswordController = TextEditingController();

  final signFullNameFocusNode = FocusNode();
  final signUpEmailFocusNode = FocusNode();
  final signUpPasswordFocusNode = FocusNode();

  void checkBoxToggle(bool v) {
    emit(SignupCubitInitial(v));
  }

  void updateIsValid() {
    isActiveButton = signUpEmailController.text.isNotEmpty &&
        signUpPasswordController.text.isNotEmpty;
  }

  void register() async {
    emit(SignupCubitLoading());
    fullName = signFullNameController.text;
    List<String> fullNameParts = fullName.split(' ');
    final String name = fullNameParts[0];
    final String surname = fullNameParts[1];
    final String fatherName = fullNameParts[2];
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
