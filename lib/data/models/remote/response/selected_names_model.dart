class SelectedNamesModel {
  final int? count;
  final String? next;
  final String? previous;
  final List<SelectedName>? results;

  SelectedNamesModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory SelectedNamesModel.fromJson(Map<String, dynamic> json) =>
      SelectedNamesModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<SelectedName>.from(
                json["results"]!.map((x) => SelectedName.fromJson(x))),
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

class SelectedName {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? user;
  final int? babyName;

  SelectedName({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.babyName,
  });

  factory SelectedName.fromJson(Map<String, dynamic> json) => SelectedName(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        user: json["user"],
        babyName: json["baby_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user,
        "baby_name": babyName,
      };

   SelectedName copyWith({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? user,
    int? babyName,
  }) {
    return SelectedName(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      user: user ?? this.user,
      babyName: babyName ?? this.babyName,
    );
  }
}
