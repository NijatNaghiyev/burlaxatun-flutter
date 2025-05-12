import 'package:equatable/equatable.dart';

class BlogCatResponse extends Equatable {
  final int? count;
  final String? next;
  final String? previous;
  final List<Result>? results;

  const BlogCatResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory BlogCatResponse.fromJson(Map<String, dynamic> json) =>
      BlogCatResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
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
  List<Object?> get props => [count, next, previous, results];
}

class Result extends Equatable {
  final int? id;
  final String? name;
  final DateTime? createdAt;
  final List<Blog>? blogs;

  const Result({
    this.id,
    this.name,
    this.createdAt,
    this.blogs,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        blogs: json["blogs"] == null
            ? []
            : List<Blog>.from(json["blogs"].map((x) => Blog.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "blogs": blogs == null
            ? []
            : List<dynamic>.from(blogs!.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [id, name, createdAt, blogs];
}

class Blog extends Equatable {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? slug;
  final String? file;
  final String? name;
  final String? text;
  final int? category;

  const Blog({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.file,
    this.name,
    this.text,
    this.category,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        slug: json["slug"],
        file: json["file"],
        name: json["name"],
        text: json["text"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "slug": slug,
        "file": file,
        "name": name,
        "text": text,
        "category": category,
      };

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        slug,
        file,
        name,
        text,
        category,
      ];
}
