import 'package:equatable/equatable.dart';

class FaqsResponse extends Equatable {
  final int? count;
  final String? next;
  final String? previous;
  final List<Result>? results;

  const FaqsResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory FaqsResponse.fromJson(Map<String, dynamic> json) => FaqsResponse(
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
  final String? question;
  final String? answer;

  const Result({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.question,
    this.answer,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "question": question,
        "answer": answer,
      };

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        question,
        answer,
      ];
}
