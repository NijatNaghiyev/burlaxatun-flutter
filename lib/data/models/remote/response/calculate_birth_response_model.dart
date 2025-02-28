// To parse this JSON data, do
//
//     final calculateBirthResponseModel = calculateBirthResponseModelFromJson(jsonString);

import 'dart:convert';

CalculateBirthResponseModel calculateBirthResponseModelFromJson(String str) => CalculateBirthResponseModel.fromJson(json.decode(str));

String calculateBirthResponseModelToJson(CalculateBirthResponseModel data) => json.encode(data.toJson());

class CalculateBirthResponseModel {
    final int status;
    final String message;
    final CalculatedData data;

    CalculateBirthResponseModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory CalculateBirthResponseModel.fromJson(Map<String, dynamic> json) => CalculateBirthResponseModel(
        status: json["status"],
        message: json["message"],
        data: CalculatedData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class CalculatedData {
    final String birthDate;
    final String inseminationDate;
    final int weeks;
    final int days;

    CalculatedData({
        required this.birthDate,
        required this.inseminationDate,
        required this.weeks,
        required this.days,
    });

    factory CalculatedData.fromJson(Map<String, dynamic> json) => CalculatedData(
        birthDate: json["birth_date"],
        inseminationDate: json["insemination_date"],
        weeks: json["weeks"],
        days: json["days"],
    );

    Map<String, dynamic> toJson() => {
        "birth_date": birthDate,
        "insemination_date": inseminationDate,
        "weeks": weeks,
        "days": days,
    };
}
