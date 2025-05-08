class PregnancyCalculateModel {
  final int? status;
  final String? message;
  final CalculatedData? data;

  PregnancyCalculateModel({
    this.status,
    this.message,
    this.data,
  });

  factory PregnancyCalculateModel.fromJson(Map<String, dynamic> json) =>
      PregnancyCalculateModel(
        status: json["status"],
        message: json["message"],
        data:
            json["data"] == null ? null : CalculatedData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class CalculatedData {
  final int? weeks;
  final int? days;
  final String? birthDate;
  final DateTime? inseminationDate;
  final String? icon;
  final String? iconUrl2;
  final String? iconName;

  CalculatedData({
    this.weeks,
    this.days,
    this.birthDate,
    this.inseminationDate,
    this.icon,
    this.iconUrl2,
    this.iconName,
  });

  factory CalculatedData.fromJson(Map<String, dynamic> json) => CalculatedData(
        weeks: json["weeks"],
        days: json["days"],
        birthDate: json["birth_date"],
        inseminationDate: json["insemination_date"] == null
            ? null
            : DateTime.parse(json["insemination_date"]),
        icon: json["icon"],
        iconUrl2: json["icon_url_2"],
        iconName: json["icon_name"],
      );

  Map<String, dynamic> toJson() => {
        "weeks": weeks,
        "days": days,
        "birth_date": birthDate,
        "insemination_date":
            "${inseminationDate!.year.toString().padLeft(4, '0')}-${inseminationDate!.month.toString().padLeft(2, '0')}-${inseminationDate!.day.toString().padLeft(2, '0')}",
        "icon": icon,
        "icon_url_2": iconUrl2,
        "icon_name": iconName,
      };
}
