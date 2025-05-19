import 'package:equatable/equatable.dart';

class ForumCommentsResponse extends Equatable {
  final int? count;
  final dynamic next;
  final dynamic previous;
  final List<Result>? results;

  const ForumCommentsResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ForumCommentsResponse.fromJson(Map<String, dynamic> json) =>
      ForumCommentsResponse(
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
  final String? user;
  final int? forum;
  final String? text;
  final dynamic parent;
  final DateTime? createdAt;
  final List<dynamic>? replies;
  final int? likeCount;
  final int? dislikeCount;

  const Result({
    this.id,
    this.user,
    this.forum,
    this.text,
    this.parent,
    this.createdAt,
    this.replies,
    this.likeCount,
    this.dislikeCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        user: json["user"],
        forum: json["forum"],
        text: json["text"],
        parent: json["parent"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        replies: json["replies"] == null
            ? []
            : List<dynamic>.from(json["replies"]!.map((x) => x)),
        likeCount: json["like_count"],
        dislikeCount: json["dislike_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "forum": forum,
        "text": text,
        "parent": parent,
        "created_at": createdAt?.toIso8601String(),
        "replies":
            replies == null ? [] : List<dynamic>.from(replies!.map((x) => x)),
        "like_count": likeCount,
        "dislike_count": dislikeCount,
      };

  @override
  List<Object?> get props => [
        id,
        user,
        forum,
        text,
        parent,
        createdAt,
        replies,
        likeCount,
        dislikeCount,
      ];
}
