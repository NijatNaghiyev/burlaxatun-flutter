import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contractor/baby_names_contractor2.dart';
import '../../data/models/remote/response/baby_names_model2.dart';

part 'baby_names2_state.dart';

class BabyNamesCubit2 extends Cubit<BabyNamesState2> {
  BabyNamesCubit2(this._babyNamesContractor) : super(BabyNamesState2.initial());

  final BabyNamesContractor _babyNamesContractor;

  Future<void> getBabyNames(String countryId) async {
    try {
      emit(state.copyWith(status: BabyNamesStatus2.loading));

      final response =
          await _babyNamesContractor.getBabyNamesByCountryId(countryId);
      emit(state.copyWith(
        status: BabyNamesStatus2.success,
        response: response,
      ));
    } on DioException catch (e) {
      emit(state.copyWith(
        status: BabyNamesStatus2.networkError,
        errorMessage: e.toString(),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BabyNamesStatus2.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
