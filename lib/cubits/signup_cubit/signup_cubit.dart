import 'dart:developer';

import 'package:burla_xatun/data/contractor/register_contractor.dart';
import 'package:burla_xatun/data/models/remote/response/login_response_model.dart';
import 'package:burla_xatun/data/services/local/login_token_service.dart';
import 'package:burla_xatun/utils/di/locator.dart';
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
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  final fullNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();

  void checkBoxToggle(bool v) {
    isChecked = v;
    emit(SignupInitial(
      isActiveButton: isActiveButton,
      isChecked: isChecked,
    ));
  }

  final _loginTokenService = locator<LoginTokenService>();

  void updateIsValid() {
    isActiveButton = emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        fullNameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        isChecked;

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
        phone: phoneController.text,
        fullName: fullNameController.text,
        email: emailController.text,
        password: passwordController.text,
      );

      final savedRegisterData = LoginResponseModel(
        refresh: response.refresh,
        access: response.access,
        activeLanguage: response.activeLanguage,
        onboardingDone: response.onboardingDone,
        enableNotifications: response.enableNotifications,
      );

      _loginTokenService.saveLoginResponse(savedRegisterData);

      emit(SignupSuccess());
      log("Register success");
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
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    fullNameFocusNode.dispose();
    phoneController.dispose();
    return super.close();
  }
}
