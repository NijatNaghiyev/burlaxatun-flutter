class NamesModel {
  final int? count;
  final String? next;
  final String? previous;
  final List<GenderName>? results;

  NamesModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory NamesModel.fromJson(Map<String, dynamic> json) => NamesModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<GenderName>.from(
                json["results"]!.map((x) => GenderName.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class GenderName {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? gender;
  final String? name;
  final int? country;

  GenderName({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.gender,
    this.name,
    this.country,
  });

  factory GenderName.fromJson(Map<String, dynamic> json) => GenderName(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        gender: json["gender"],
        name: json["name"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "gender": gender,
        "name": name,
        "country": country,
      };
}
