import 'dart:developer';

import 'package:burla_xatun/data/contractor/user_update_contractor.dart';
import 'package:burla_xatun/data/models/remote/response/user_update_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_update_state.dart';

class UserUpdateCubit extends Cubit<UserUpdateState> {
  UserUpdateCubit(this._contractor) : super(UserUpdateInitial());

  final UserUpdateContractor _contractor;

  String? phoneNumber = "";
  bool? onboardingDone = true;
  bool? wantToBePregnant = true;
  bool? wantToSeePeriod = true;
  bool? isPregnant = true;
  String? pregnantWeek = "";
  bool? firstChild = true;
  String? activeLanguage = "";
  bool? enableNotifications = true;

  Future<void> updateUser() async {
    try {
      emit(UserUpdateLoading());
      log("User Update Loading");

      final response = await _contractor.updateUser(
        activeLanguage: activeLanguage,
        enableNotifications: enableNotifications,
        firstChild: firstChild,
        isPregnant: isPregnant,
        onboardingDone: onboardingDone,
        phoneNumber: phoneNumber,
        pregnantWeek: pregnantWeek,
        wantToBePregnant: wantToBePregnant,
        wantToSeePeriod: wantToSeePeriod,
      );
      emit(UserUpdateSuccess(response));
    } on DioException catch (e, s) {
      emit(UserUpdateNetworkError(e.toString()));
      log("User Update Dio Exception: $e", stackTrace: s);
    } catch (e, s) {
      emit(UserUpdateError(e.toString()));
      log("User Update Unknown Error: $e", stackTrace: s);
    }
  }
}
