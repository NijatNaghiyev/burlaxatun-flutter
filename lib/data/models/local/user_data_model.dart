import 'package:hive/hive.dart';

part 'user_data_model.g.dart';

@HiveType(typeId: 0)
class UserDataModel {
  UserDataModel({
    required this.id,
    required this.email,
    required this.name,
    required this.surname,
    required this.fatherName,
    required this.birthDate,
    required this.parentType,
    required this.phone,
    required this.avatar,
    required this.parentName,
    required this.age,
  });

  @HiveField(0)
  String id;

  @HiveField(1)
  String email;

  @HiveField(2)
  String name;

  @HiveField(3)
  String surname;

  @HiveField(4)
  String fatherName;

  @HiveField(5)
  String birthDate;

  @HiveField(6)
  String parentType;

  @HiveField(7)
  String phone;

  @HiveField(8)
  String avatar;

  @HiveField(9)
  String parentName;

  @HiveField(10)
  int age;
}
