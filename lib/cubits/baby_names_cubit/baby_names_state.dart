part of 'baby_names_cubit.dart';

// abstract class BabyNamesState {}

class BabyNamesInitial extends Equatable {
  const BabyNamesInitial({
    required this.selectedNames,
    required this.names,
    required this.countryList,
    required this.nameStateStatus,
    required this.selectNameStatus,
    required this.selectedNameIndex,
    required this.isSelected,
  });

  final NameStateStatus? nameStateStatus;
  final SelectNameStatus? selectNameStatus;
  final List<CountryData>? countryList;
  final List<SelectedNameData>? selectedNames;
  final NamesData? names;
  final int? selectedNameIndex;
  final int? isSelected;

  @override
  List<Object?> get props => [
        names,
        selectedNames,
        countryList,
        nameStateStatus,
        selectedNameIndex,
        selectNameStatus,
        isSelected
      ];

  BabyNamesInitial copyWith({
    NameStateStatus? nameStateStatus,
    SelectNameStatus? selectNameStatus,
    List<CountryData>? countryList,
    List<SelectedNameData>? selectedNames,
    NamesData? names,
    int? selectedNameIndex,
    int? isSelected,
  }) {
    return BabyNamesInitial(
      selectedNames: selectedNames ?? this.selectedNames,
      names: names ?? this.names,
      countryList: countryList ?? this.countryList,
      nameStateStatus: nameStateStatus ?? this.nameStateStatus,
      selectedNameIndex: selectedNameIndex ?? this.selectedNameIndex,
      selectNameStatus: selectNameStatus ?? this.selectNameStatus,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
