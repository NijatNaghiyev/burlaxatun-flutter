class CalculationOptionsModel {
  const CalculationOptionsModel({required this.optionName});

  final String optionName;

  static const List options = [
    CalculationOptionsModel(optionName: 'Mayalanma'),
    CalculationOptionsModel(optionName: 'Son periodumun birinci günü'),
    CalculationOptionsModel(optionName: 'Süni mayalanma'),
    CalculationOptionsModel(optionName: 'Ultrasəslə'),
  ];
}
