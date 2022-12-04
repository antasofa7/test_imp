import 'package:my_apps/models/created_model.dart';

class UsersModel {
  UsersModel({
    required this.code,
    required this.status,
    required this.message,
    required this.user,
  });

  final int code;
  final bool status;
  final String message;
  final User user;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.created,
    required this.uuid,
  });

  final String name;
  final String email;
  final String phoneNumber;
  final Created created;
  final String uuid;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        created: Created.fromJson(json["created"]),
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "created": created.toJson(),
        "uuid": uuid,
      };
}
