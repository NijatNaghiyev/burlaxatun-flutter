import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contractor/user_data_contractor.dart';
import '../../data/models/remote/response/user_data_model.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit(this._userDataContractor) : super(UserDataState.initial());

  final UserDataContractor _userDataContractor;

  Future<void> getUserData() async {
    try {
      emit(state.copyWith(status: UserDataStatus.loading));

      final response = await _userDataContractor.getUserData();

      emit(state.copyWith(
        status: UserDataStatus.success,
        response: response,
      ));
    } on DioException catch (e) {
      emit(state.copyWith(
        status: UserDataStatus.networkError,
        errorMessage: e.toString(),
      ));
    } catch (e, stackTrace) {
      emit(state.copyWith(
        status: UserDataStatus.failure,
        errorMessage: e.toString(),
      ));
      debugPrint("Error: $e");
      debugPrint("Stack trace: $stackTrace");
    }
  }
}
