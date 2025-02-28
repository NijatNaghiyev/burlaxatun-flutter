class SelectedNamesModel {
    final int status;
    final String message;
    final List<SelectedNameData> data;

    SelectedNamesModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory SelectedNamesModel.fromJson(Map<String, dynamic> json) => SelectedNamesModel(
        status: json["status"],
        message: json["message"],
        data: List<SelectedNameData>.from(json["data"].map((x) => SelectedNameData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class SelectedNameData {
    final String id;
    final String name;
    final String country;
    final String gender;

    SelectedNameData({
        required this.id,
        required this.name,
        required this.country,
        required this.gender,
    });

    factory SelectedNameData.fromJson(Map<String, dynamic> json) => SelectedNameData(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        gender: json["gender"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "gender": gender,
    };
}
