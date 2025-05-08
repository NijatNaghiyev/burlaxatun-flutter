import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contractor/countries_contractor.dart';
import '../../data/models/remote/response/countries_model.dart';

part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit(this._countriesContractor) : super(CountriesState.initial());

  final CountriesContractor _countriesContractor;

  Future<void> getCountries() async {
    try {
      emit(state.copyWith(status: CountriesStatus.loading));

      final response = await _countriesContractor.getCountries();

      emit(state.copyWith(
        status: CountriesStatus.success,
        response: response,
      ));
    } on DioException catch (e) {
      emit(state.copyWith(
        status: CountriesStatus.networkError,
        errorMessage: e.toString(),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CountriesStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
