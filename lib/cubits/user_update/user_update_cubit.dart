import 'dart:developer';
import 'dart:io';

import 'package:burla_xatun/data/contractor/user_update_contractor.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_update_state.dart';

class UserUpdateCubit extends Cubit<UserUpdateState> {
  UserUpdateCubit(this._contractor)
      : super(const UserUpdateState(status: UserUpdateStatus.initial));

  final UserUpdateContractor _contractor;

  Future<void> updateUser(
      {String? phoneNumber,
      bool? onboardingDone,
      bool? wantToBePregnant,
      bool? wantToSeePeriod,
      bool? isPregnant,
      String? pregnantWeek,
      bool? firstChild,
      String? activeLanguage,
      bool? enableNotifications,
      File? image}) async {
    try {
      emit(state.copyWith(status: UserUpdateStatus.loading));
      log("User Update Loading");

      final response = await _contractor.updateUser(
        activeLanguage: activeLanguage,
        enableNotifications: enableNotifications,
        firstChild: firstChild,
        isPregnant: isPregnant,
        onboardingDone: onboardingDone,
        phoneNumber: phoneNumber,
        pregnantWeek: pregnantWeek,
        image: image,
        wantToBePregnant: wantToBePregnant,
        wantToSeePeriod: wantToSeePeriod,
      );

      if (response != null) {
        emit(state.copyWith(status: UserUpdateStatus.success));
        log('User Update Success');
      } else {
        emit(state.copyWith(
          status: UserUpdateStatus.failure,
          message: 'Failed to update user',
        ));
      }
    } on DioException catch (e, s) {
      emit(state.copyWith(
        status: UserUpdateStatus.networkError,
        message: e.message ?? e.toString(),
      ));
      log("User Update Dio Exception: $e", stackTrace: s);
    } catch (e, s) {
      emit(state.copyWith(
        status: UserUpdateStatus.failure,
        message: e.toString(),
      ));
      log("User Update Unknown Error: $e", stackTrace: s);
    }
  }
}

// class UserUpdateCubit extends Cubit<UserUpdateState> {
//   UserUpdateCubit(this._contractor) : super(UserUpdateInitial());
//
//   final UserUpdateContractor _contractor;
//
//   // String? phoneNumber = "";
//   // bool? onboardingDone = true;
//   // bool? wantToBePregnant = true;
//   // bool? wantToSeePeriod = true;
//   // bool? isPregnant = true;
//   // String? pregnantWeek = "";
//   // bool? firstChild = true;
//   // String? activeLanguage = "";
//   // bool? enableNotifications = true;
//
//   Future<void> updateUser(
//       {String? phoneNumber,
//       bool? onboardingDone,
//       bool? wantToBePregnant,
//       bool? wantToSeePeriod,
//       bool? isPregnant,
//       String? pregnantWeek,
//       String? image,
//       bool? firstChild,
//       String? activeLanguage,
//       bool? enableNotifications}) async {
//     try {
//       emit(UserUpdateLoading());
//       log("User Update Loading");
//
//       final response = await _contractor.updateUser(
//         activeLanguage: activeLanguage,
//         enableNotifications: enableNotifications,
//         firstChild: firstChild,
//         isPregnant: isPregnant,
//         onboardingDone: onboardingDone,
//         phoneNumber: phoneNumber,
//         pregnantWeek: pregnantWeek,
//         image: image,
//         wantToBePregnant: wantToBePregnant,
//         wantToSeePeriod: wantToSeePeriod,
//       );
//       emit(UserUpdateSuccess(response));
//     } on DioException catch (e, s) {
//       emit(UserUpdateNetworkError(e.toString()));
//       log("User Update Dio Exception: $e", stackTrace: s);
//     } catch (e, s) {
//       emit(UserUpdateError(e.toString()));
//       log("User Update Unknown Error: $e", stackTrace: s);
//     }
//   }
// }
