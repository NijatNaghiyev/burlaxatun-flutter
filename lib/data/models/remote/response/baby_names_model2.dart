import 'package:equatable/equatable.dart';

class BabyNamesResponse2 extends Equatable {
  final int? count;
  final String? next;
  final String? previous;
  final List<Result>? results;

  const BabyNamesResponse2({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory BabyNamesResponse2.fromJson(Map<String, dynamic> json) =>
      BabyNamesResponse2(
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

  @override
  List<Object?> get props => [
        count,
        next,
        previous,
        results,
      ];
}

class Result extends Equatable {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? gender;
  final String? name;
  final int? country;

  const Result({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.gender,
    this.name,
    this.country,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        gender,
        name,
        country,
      ];
}
