class UltrasoundModel {
  final int? count;
  final dynamic next;
  final dynamic previous;
  final List<Result>? results;

  UltrasoundModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  UltrasoundModel copyWith({
    int? count,
    dynamic next,
    dynamic previous,
    List<Result>? results,
  }) =>
      UltrasoundModel(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results,
      );

  factory UltrasoundModel.fromJson(Map<String, dynamic> json) =>
      UltrasoundModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
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

class Result {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? slug;
  final String? week;
  final String? image2D;
  final String? image3D;

  Result({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.week,
    this.image2D,
    this.image3D,
  });

  Result copyWith({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? slug,
    String? week,
    String? image2D,
    String? image3D,
  }) =>
      Result(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        slug: slug ?? this.slug,
        week: week ?? this.week,
        image2D: image2D ?? this.image2D,
        image3D: image3D ?? this.image3D,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        slug: json["slug"],
        week: json["week"],
        image2D: json["image_2d"],
        image3D: json["image_3d"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "slug": slug,
        "week": week,
        "image_2d": image2D,
        "image_3d": image3D,
      };
}
