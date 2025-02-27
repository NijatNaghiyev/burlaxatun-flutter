class CountryNamesModel {
    final int status;
    final String message;
    final List<CountryData> data;

    CountryNamesModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory CountryNamesModel.fromJson(Map<String, dynamic> json) => CountryNamesModel(
        status: json["status"],
        message: json["message"],
        data: List<CountryData>.from(json["data"].map((x) => CountryData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class CountryData {
    final String id;
    final String title;
    final String flag;

    CountryData({
        required this.id,
        required this.title,
        required this.flag,
    });

    factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
        id: json["id"],
        title: json["title"],
        flag: json["flag"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "flag": flag,
    };
}
