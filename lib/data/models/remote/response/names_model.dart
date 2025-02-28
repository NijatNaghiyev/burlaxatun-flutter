
class NamesModel {
    final int status;
    final String message;
    final NamesData data;

    NamesModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory NamesModel.fromJson(Map<String, dynamic> json) => NamesModel(
        status: json["status"],
        message: json["message"],
        data: NamesData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class NamesData {
    final List<Gender> boys;
    final List<Gender> girls;

    NamesData({
        required this.boys,
        required this.girls,
    });

    factory NamesData.fromJson(Map<String, dynamic> json) => NamesData(
        boys: List<Gender>.from(json["boys"].map((x) => Gender.fromJson(x))),
        girls: List<Gender>.from(json["girls"].map((x) => Gender.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "boys": List<dynamic>.from(boys.map((x) => x.toJson())),
        "girls": List<dynamic>.from(girls.map((x) => x.toJson())),
    };
}

class Gender {
    final String id;
    final String name;
    final int selected;

    Gender({
        required this.id,
        required this.name,
        required this.selected,
    });

    factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        id: json["id"],
        name: json["name"],
        selected: json["selected"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "selected": selected,
    };
}
