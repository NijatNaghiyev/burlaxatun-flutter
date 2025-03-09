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
          selectedNameIndex: -1,
        ));

  final BabyNamesService babyNamesService = BabyNamesService();

  // List<CountryData> countryList = [];
  // selectde istifade olunacaq bir list yaratmaliyiq o listden istifade etmeliyik

  void updateSelectedNameIndex(int v) {
    emit(state.copyWith(selectedNameIndex: v));
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

  Future<void> getNames(String countryId) async {
    try {
      emit(state.copyWith(nameStateStatus: NameStateStatus.loading));
      final data = await babyNamesService.getGenderNames(countryId);
      emit(state.copyWith(
        names: data,
        nameStateStatus: NameStateStatus.success,
      ));
      log('AFTER SUCCESS: ${state.nameStateStatus}');
    } catch (e, s) {
      emit(state.copyWith(nameStateStatus: NameStateStatus.error));
      log('Error: $e');
      log('Stack Trace: $s');
      throw Exception();
    }
  }

  Future<void> updateSelectedNames() async {
    try {
      emit(state.copyWith(nameStateStatus: NameStateStatus.loading));
      final selecteds = await babyNamesService.getSelectedNames();
      emit(state.copyWith(
          selectedNames: selecteds, nameStateStatus: NameStateStatus.success));
    } catch (e, s) {
      emit(state.copyWith(nameStateStatus: NameStateStatus.error));
      log('Error: $e');
      log('Stack Trace: $s');
      throw Exception();
    }
  }

  Future<void> selectName(String nameId) async {
    try {
      emit(state.copyWith(nameStateStatus: NameStateStatus.loading));
      final isSuccess = await babyNamesService.selectName(nameId);
      if (isSuccess) {
        log('Name selected successfully');
        await updateSelectedNames();
        emit(state.copyWith(nameStateStatus: NameStateStatus.success));
      } else {
        log('Name selection failed');
        emit(state.copyWith(nameStateStatus: NameStateStatus.error));
      }
    } catch (e, s) {
      emit(state.copyWith(nameStateStatus: NameStateStatus.error));
      log('Error: $e');
      log('Stack Trace: $s');
      throw Exception();
    }
  }
}
