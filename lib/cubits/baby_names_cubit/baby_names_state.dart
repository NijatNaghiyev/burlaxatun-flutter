part of 'baby_names_cubit.dart';

class BabyNamesState extends Equatable {
  const BabyNamesState({
    this.nameStateStatus = NameStateStatus.initial,
    this.selectNameStatus = SelectNameStatus.initial,
    this.countries,
    this.maleNamesList,
    this.femaleNamesList,
    this.selectedNamesList,
  });

  final NameStateStatus? nameStateStatus;
  final SelectNameStatus? selectNameStatus;
  final CountriesResponse? countries;
  final List<GenderName>? maleNamesList;
  final List<GenderName>? femaleNamesList;
  final List<SelectedName>? selectedNamesList;

  @override
  List<Object?> get props => [
        nameStateStatus,
        selectNameStatus,
        countries,
        maleNamesList,
        femaleNamesList,
        selectedNamesList
      ];

  BabyNamesState copyWith({
    NameStateStatus? nameStateStatus,
    final SelectNameStatus? selectNameStatus,
    CountriesResponse? countries,
    List<GenderName>? maleNamesList,
    List<GenderName>? femaleNamesList,
    List<SelectedName>? selectedNamesList,
  }) {
    return BabyNamesState(
      nameStateStatus: nameStateStatus ?? this.nameStateStatus,
      selectNameStatus: selectNameStatus ?? this.selectNameStatus,
      countries: countries ?? this.countries,
      maleNamesList: maleNamesList ?? this.maleNamesList,
      femaleNamesList: femaleNamesList ?? this.femaleNamesList,
      selectedNamesList: selectedNamesList ?? this.selectedNamesList,
    );
  }
}
