class IndicatorModel {
  final String? time;
  final double? value;

  IndicatorModel({
    this.time,
    this.value,
  });

  factory IndicatorModel.fromJson(Map<String, dynamic> json) => IndicatorModel(
        time: json["time"],
        value: json["value"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "value": value,
      };
}
