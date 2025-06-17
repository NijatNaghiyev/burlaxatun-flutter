import 'package:equatable/equatable.dart';

class ChangePassModel extends Equatable {
  final String? oldPassword;
  final String? newPassword1;
  final String? newPassword2;

  const ChangePassModel({
    this.oldPassword,
    this.newPassword1,
    this.newPassword2,
  });

  factory ChangePassModel.fromJson(Map<String, dynamic> json) =>
      ChangePassModel(
        oldPassword: json["old_password"],
        newPassword1: json["new_password1"],
        newPassword2: json["new_password2"],
      );

  Map<String, dynamic> toJson() => {
        "old_password": oldPassword,
        "new_password1": newPassword1,
        "new_password2": newPassword2,
      };

  @override
  List<Object?> get props => [
        oldPassword,
        newPassword1,
        newPassword2,
      ];
}
