import 'package:equatable/equatable.dart';

class NamesModel extends Equatable {
  final int status;
  final String message;
  final NamesData data;

  const NamesModel({
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

  @override
  List<Object?> get props => [status, message, data];
}

class NamesData extends Equatable {
  final List<Gender> boys;
  final List<Gender> girls;

  const NamesData({
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

  @override
  List<Object?> get props => [
        // DeepCollectionEquality().hash(boys),
        boys,
        girls,
        // DeepCollectionEquality().hash(girls),
      ];
}

class Gender extends Equatable {
  final String id;
  final String name;
  final int selected;

  const Gender({
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

  @override
  List<Object?> get props => [id, name, selected];
}
