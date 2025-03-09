part of 'baby_names_cubit.dart';

// abstract class BabyNamesState {}

class BabyNamesInitial extends Equatable {
  const BabyNamesInitial({
    required this.selectedNames,
    required this.names,
    required this.countryList,
    required this.nameStateStatus,
    required this.selectedNameIndex,
  });

  final NameStateStatus? nameStateStatus;
  final List<CountryData>? countryList;
  final List<SelectedNameData>? selectedNames;
  final NamesData? names;
  final int? selectedNameIndex;

  @override
  List<Object?> get props => [
        names,
        selectedNames,
        countryList,
        nameStateStatus,
        selectedNameIndex,
      ];

  BabyNamesInitial copyWith({
    NameStateStatus? nameStateStatus,
    List<CountryData>? countryList,
    List<SelectedNameData>? selectedNames,
    NamesData? names,
    final int? selectedNameIndex,
  }) {
    return BabyNamesInitial(
      selectedNames: selectedNames ?? this.selectedNames,
      names: names ?? this.names,
      countryList: countryList ?? this.countryList,
      nameStateStatus: nameStateStatus ?? this.nameStateStatus,
      selectedNameIndex: selectedNameIndex ?? this.selectedNameIndex,
    );
  }
}
