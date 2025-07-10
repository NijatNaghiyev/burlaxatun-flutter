import 'package:equatable/equatable.dart';

class BlogSlidersResponse extends Equatable {
  final int? count;
  final String? next;
  final String? previous;
  final List<Result>? results;

  const BlogSlidersResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory BlogSlidersResponse.fromJson(Map<String, dynamic> json) =>
      BlogSlidersResponse(
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
  final String? topSentence;
  final String? bottomSentence;
  final String? text;
  final String? backgroundImage;

  const Result({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.topSentence,
    this.bottomSentence,
    this.text,
    this.backgroundImage,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        topSentence: json["top_sentence"],
        bottomSentence: json["bottom_sentence"],
        text: json["text"],
        backgroundImage: json["background_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "top_sentence": topSentence,
        "bottom_sentence": bottomSentence,
        "text": text,
        "background_image": backgroundImage,
      };

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        topSentence,
        bottomSentence,
        text,
        backgroundImage,
      ];
}
