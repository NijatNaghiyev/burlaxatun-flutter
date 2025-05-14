import 'package:equatable/equatable.dart';

class MedicineCreateResponse extends Equatable {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? slug;
  final String? name;
  final String? dose;
  final String? frequency;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? status;
  final int? user;

  const MedicineCreateResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.name,
    this.dose,
    this.frequency,
    this.startDate,
    this.endDate,
    this.status,
    this.user,
  });

  factory MedicineCreateResponse.fromJson(Map<String, dynamic> json) =>
      MedicineCreateResponse(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        slug: json["slug"],
        name: json["name"],
        dose: json["dose"],
        frequency: json["frequency"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        status: json["status"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "slug": slug,
        "name": name,
        "dose": dose,
        "frequency": frequency,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "status": status,
        "user": user,
      };

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        slug,
        name,
        dose,
        frequency,
        startDate,
        endDate,
        status,
        user,
      ];
}
