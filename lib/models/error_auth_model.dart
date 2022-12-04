// To parse this JSON data, do
//
//     final errorAuthModel = errorAuthModelFromJson(jsonString);

class ErrorAuthModel {
  ErrorAuthModel({
    required this.status,
    required this.code,
    required this.message,
    required this.errors,
  });

  final bool status;
  final int code;
  final String message;
  final Errors errors;

  factory ErrorAuthModel.fromJson(Map<String, dynamic> json) => ErrorAuthModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        errors: Errors.fromJson(json["errors"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "errors": errors.toJson(),
      };
}

class Errors {
  Errors({
    required this.email,
    required this.password,
  });

  final List<String> email;
  final List<String> password;

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        email: json["email"] != null
            ? List<String>.from(json["email"].map((x) => x))
            : <String>[],
        password: json["password"] != null
            ? List<String>.from(json["password"].map((x) => x))
            : <String>[],
      );

  Map<String, dynamic> toJson() => {
        "email": List<dynamic>.from(email.map((x) => x)),
        "password": List<dynamic>.from(password.map((x) => x)),
      };
}
