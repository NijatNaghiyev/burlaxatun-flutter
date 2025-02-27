part of 'baby_names_cubit.dart';

abstract class BabyNamesState {}

class BabyNamesInitial extends BabyNamesState {}

class BabyNamesSuccess extends BabyNamesState {
  BabyNamesSuccess({
    this.names,
    this.countryList,
    this.selectedNames,
  });
  final List<SelectedNameData>? selectedNames;
  final NamesData? names;
  final List<CountryData>? countryList;
}

class BabyNamesError extends BabyNamesState {}

class BabyNamesLoading extends BabyNamesState {}
