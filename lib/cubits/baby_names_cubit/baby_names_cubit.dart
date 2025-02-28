import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/remote/response/country_names_model.dart';
import '../../data/models/remote/response/names_model.dart';
import '../../data/models/remote/response/selected_names_model.dart';
import '../../data/services/remote/baby_names_service.dart';

part 'baby_names_state.dart';

enum NameStateStatus { initial, loading, error, success }

class BabyNamesCubit extends Cubit<BabyNamesInitial> {
  BabyNamesCubit()
      : super(BabyNamesInitial(
          selectedNames: null,
          countryList: null,
          names: null,
          nameStateStatus: NameStateStatus.initial,
        ));

  final BabyNamesService babyNamesService = BabyNamesService();

  // List<CountryData> countryList = [];
  // selectde istifade olunacaq bir list yaratmaliyiq o listden istifade etmeliyik

  void stateLoading() {
    emit(state.copyWith(nameStateStatus: NameStateStatus.loading));
  }

  Future<void> getCountriesAndSelectedNames() async {
    try {
      emit(state.copyWith(nameStateStatus: NameStateStatus.loading));
      final countriesData = await babyNamesService.getCountries();
      final selectedNames = await babyNamesService.getSelectedNames();
      emit(state.copyWith(
        countryList: countriesData,
        selectedNames: selectedNames,
        nameStateStatus: NameStateStatus.success,
      ));
    } catch (e, s) {
      emit(state.copyWith(nameStateStatus: NameStateStatus.error));
      log('Error: $e');
      log('Stack Trace: $s');
      throw Exception();
    }
  }

  Future<void> getNames(String id) async {
    emit(state.copyWith(nameStateStatus: NameStateStatus.loading));
    log('state status: ${state.nameStateStatus}');
    try {
      final data = await babyNamesService.getGenderNames(id);
      emit(state.copyWith(
        names: data,
        nameStateStatus: NameStateStatus.success,
      ));
    } catch (e, s) {
      emit(state.copyWith(nameStateStatus: NameStateStatus.error));
      log('Error: $e');
      log('Stack Trace: $s');
      throw Exception();
    }
  }

  void selectName(String nameId) async {
    try {
      emit(state.copyWith(nameStateStatus: NameStateStatus.loading));
      final isSuccess = await babyNamesService.selectName(nameId);
      if (isSuccess) {
        log('Name selected successfully');
        emit(state.copyWith(nameStateStatus: NameStateStatus.success));
      } else {
        log('Name selection failed');
        emit(state.copyWith(nameStateStatus: NameStateStatus.error));
      }
    } catch (e, s) {
      log('Error: $e');
      log('Stack Trace: $s');
      throw Exception();
    }
  }
}
