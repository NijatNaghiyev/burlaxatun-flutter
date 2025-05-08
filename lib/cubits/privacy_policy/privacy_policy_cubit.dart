import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contractor/privacy_policy_contractor.dart';
import '../../data/models/remote/response/privacy_policy_model.dart';

part 'privacy_policy_state.dart';

class PrivacyPolicyCubit extends Cubit<PrivacyPolicyState> {
  PrivacyPolicyCubit(this._privacyPolicyContractor)
      : super(PrivacyPolicyState.initial());

  final PrivacyPolicyContractor _privacyPolicyContractor;

  Future<void> getPrivacyPolicy() async {
    try {
      emit(state.copyWith(status: PrivacyPolicyStatus.loading));

      final response = await _privacyPolicyContractor.getPrivacyPolicy();

      emit(state.copyWith(
        status: PrivacyPolicyStatus.success,
        response: response,
      ));
    } on DioException catch (e) {
      emit(state.copyWith(
        status: PrivacyPolicyStatus.networkError,
        errorMessage: e.toString(),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: PrivacyPolicyStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
