import 'package:equatable/equatable.dart';

class DailyRecDetailResponse extends Equatable {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? slug;
  final int? day;
  final String? name;
  final String? text;
  final String? image;

  const DailyRecDetailResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.day,
    this.name,
    this.text,
    this.image,
  });

  factory DailyRecDetailResponse.fromJson(Map<String, dynamic> json) =>
      DailyRecDetailResponse(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        slug: json["slug"],
        day: json["day"],
        name: json["name"],
        text: json["text"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "slug": slug,
        "day": day,
        "name": name,
        "text": text,
        "image": image,
      };

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        slug,
        day,
        name,
        text,
        image,
      ];
}
