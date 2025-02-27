import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/remote/response/country_names_model.dart';
import '../../data/models/remote/response/names_model.dart';
import '../../data/models/remote/response/selected_names_model.dart';
import '../../data/services/remote/baby_names_service.dart';

part 'baby_names_state.dart';

class BabyNamesCubit extends Cubit<BabyNamesState> {
  BabyNamesCubit() : super(BabyNamesInitial());
  final BabyNamesService babyNamesService = BabyNamesService();

  // List<CountryData> countryList = [];

  void getCountriesAndSelectedNames() async {
    try {
      emit(BabyNamesLoading());
      final countriesData = await babyNamesService.getCountries();
      final selectedNames = await babyNamesService.getSelectedNames();
      emit(BabyNamesSuccess(
          countryList: countriesData, selectedNames: selectedNames));
    } catch (e, s) {
      emit(BabyNamesError());
      log('Error: $e');
      log('Stack Trace: $s');
      throw Exception();
    }
  }

  void getNames(String id) async {
    try {
      emit(BabyNamesLoading());
      final data = await babyNamesService.getGenderNames(id);
      emit(BabyNamesSuccess(names: data));
    } catch (e, s) {
      emit(BabyNamesError());
      log('Error: $e');
      log('Stack Trace: $s');
      throw Exception();
    }
  }

  void selectName(int nameId){
    // emit(state);
  }
}
