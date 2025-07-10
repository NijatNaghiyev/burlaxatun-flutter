import 'package:equatable/equatable.dart';

class ContactResponse extends Equatable {
  final int? count;
  final String? next;
  final String? previous;
  final List<Result>? results;

  const ContactResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ContactResponse.fromJson(Map<String, dynamic> json) =>
      ContactResponse(
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
  final String? callTop;
  final String? callBottom;
  final String? callIcon;
  final String? whatsappTop;
  final String? whatsappBottom;
  final String? whatsappIcon;
  final String? emailTop;
  final String? emailBottom;
  final String? emailIcon;

  const Result({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.callTop,
    this.callBottom,
    this.callIcon,
    this.whatsappTop,
    this.whatsappBottom,
    this.whatsappIcon,
    this.emailTop,
    this.emailBottom,
    this.emailIcon,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        callTop: json["call_top"],
        callBottom: json["call_bottom"],
        callIcon: json["call_icon"],
        whatsappTop: json["whatsapp_top"],
        whatsappBottom: json["whatsapp_bottom"],
        whatsappIcon: json["whatsapp_icon"],
        emailTop: json["email_top"],
        emailBottom: json["email_bottom"],
        emailIcon: json["email_icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "call_top": callTop,
        "call_bottom": callBottom,
        "call_icon": callIcon,
        "whatsapp_top": whatsappTop,
        "whatsapp_bottom": whatsappBottom,
        "whatsapp_icon": whatsappIcon,
        "email_top": emailTop,
        "email_bottom": emailBottom,
        "email_icon": emailIcon,
      };

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        callTop,
        callBottom,
        callIcon,
        whatsappTop,
        whatsappBottom,
        whatsappIcon,
        emailTop,
        emailBottom,
        emailIcon,
      ];
}
