class NotificationsModel {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? title;
  final String? text;
  final int? user;

  NotificationsModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.text,
    this.user,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      NotificationsModel(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        title: json["title"],
        text: json["text"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "title": title,
        "text": text,
        "user": user,
      };
}
