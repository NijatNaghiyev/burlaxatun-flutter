import 'package:equatable/equatable.dart';

class ForumCreateModel extends Equatable {
  final int? category;
  final String? text;

  const ForumCreateModel({
    this.category,
    this.text,
  });

  factory ForumCreateModel.fromJson(Map<String, dynamic> json) =>
      ForumCreateModel(
        category: json["category"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "text": text,
      };

  @override
  List<Object?> get props => [
        category,
        text,
      ];
}
