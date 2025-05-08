import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contractor/using_rules_contractor.dart';
import '../../data/models/remote/response/using_rules_model.dart';

part 'using_rules_state.dart';

class UsingRulesCubit extends Cubit<UsingRulesState> {
  UsingRulesCubit(this._usingRulesContractor)
      : super(UsingRulesState.initial());

  final UsingRulesContractor _usingRulesContractor;

  Future<void> getUsingRules() async {
    try {
      emit(state.copyWith(status: UsingRulesStatus.loading));

      final response = await _usingRulesContractor.getUsingRules();

      emit(state.copyWith(
        status: UsingRulesStatus.success,
        response: response,
      ));
    } on DioException catch (e) {
      emit(state.copyWith(
        status: UsingRulesStatus.networkError,
        errorMessage: e.toString(),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: UsingRulesStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
