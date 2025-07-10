import 'package:equatable/equatable.dart';

class ForumListResponse extends Equatable {
  final int? count;
  final dynamic next;
  final dynamic previous;
  final List<Result>? results;

  const ForumListResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ForumListResponse.fromJson(Map<String, dynamic> json) =>
      ForumListResponse(
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
  final User? user;
  final Category? category;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? slug;
  final String? text;
  final int? viewCount;
  final int? likes;

  const Result({
    this.id,
    this.user,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.text,
    this.viewCount,
    this.likes,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        slug: json["slug"],
        text: json["text"],
        viewCount: json["view_count"],
        likes: json["likes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "category": category?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "slug": slug,
        "text": text,
        "view_count": viewCount,
        "likes": likes,
      };

  @override
  List<Object?> get props => [
        id,
        user,
        category,
        createdAt,
        updatedAt,
        slug,
        text,
        viewCount,
        likes,
      ];
}

class Category extends Equatable {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? order;
  final String? name;
  final bool? isActive;

  const Category({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.order,
    this.name,
    this.isActive,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        order: json["order"],
        name: json["name"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "order": order,
        "name": name,
        "is_active": isActive,
      };

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        order,
        name,
        isActive,
      ];
}

class User extends Equatable {
  final int? id;
  final String? fullName;
  final String? email;

  const User({
    this.id,
    this.fullName,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
      };

  @override
  List<Object?> get props => [
        id,
        fullName,
        email,
      ];
}
