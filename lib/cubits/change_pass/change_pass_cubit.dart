import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contractor/change_pass_contractor.dart';

part 'change_pass_state.dart';

class ChangePassCubit extends Cubit<ChangePassState> {
  ChangePassCubit(this._changePassContractor)
      : super(const ChangePassState(status: ChangePassStatus.initial));

  final ChangePassContractor _changePassContractor;

  Future<void> changePass({
    required String oldPassword,
    required String newPassword1,
    required String newPassword2,
  }) async {
    try {
      emit(state.copyWith(status: ChangePassStatus.loading));
      log("Change pass loading");

      final response = await _changePassContractor.changePass(
        oldPassword: oldPassword,
        newPassword1: newPassword1,
        newPassword2: newPassword2,
      );

      if (response) {
        emit(state.copyWith(
            status: ChangePassStatus.success,
            message: 'Password changed successfully'));
        log('Change pass success');
        return;
      } else {
        emit(state.copyWith(
            status: ChangePassStatus.failure,
            message: 'Password change failed'));
        log('Change pass failure: response was false');
      }
    } on DioException catch (e, s) {
      final errorMessage = e.response?.data['message'] ??
          e.response?.data['detail'] ??
          'Network error occurred';
      emit(state.copyWith(
        status: ChangePassStatus.networkError,
        message: errorMessage,
      ));
      log("Change pass DioException: $e", stackTrace: s);
    } catch (e, s) {
      emit(state.copyWith(
        status: ChangePassStatus.failure,
        message: 'Unexpected error occurred',
      ));
      log("Change pass unknown error: $e", stackTrace: s);
    }
  }

  void reset() {
    emit(const ChangePassState(status: ChangePassStatus.initial));
  }
}
