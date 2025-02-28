class RegisterResponseModel {
  final int status;
  final String message;
  final Data data;

  RegisterResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  final String id;
  final String email;
  final String name;
  final String surname;
  final String fathername;
  final String role;
  final String token;

  Data({
    required this.id,
    required this.email,
    required this.name,
    required this.surname,
    required this.fathername,
    required this.role,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        surname: json["surname"],
        fathername: json["fathername"],
        role: json["role"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "surname": surname,
        "fathername": fathername,
        "role": role,
        "token": token,
      };
}
