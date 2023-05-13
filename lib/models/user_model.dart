import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? code;
  final String? message;
  final DataUser? data;

  const UserModel({
    this.code,
    this.message,
    this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : DataUser.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };

  @override
  List<Object?> get props => [
        "code: $code",
        "message: $message",
        "data: ${data?.toJson()}",
      ];
}

class DataUser extends Equatable {
  final int? id;
  final String? name;
  final dynamic jenisUser;
  final String? email;
  final String? level;
  final String? pathFoto;
  final String? accessToken;
  final String? tokenType;
  final String? expiresIn;
  final String? nik;

  const DataUser({
    this.id,
    this.name,
    this.jenisUser,
    this.email,
    this.level,
    this.pathFoto,
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.nik,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        id: json["id"],
        name: json["name"],
        jenisUser: json["jenis_user"],
        email: json["email"],
        level: json["level"],
        pathFoto: json["path_foto"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        nik: json["nik"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "jenis_user": jenisUser,
        "email": email,
        "level": level,
        "path_foto": pathFoto,
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "nik": nik,
      };

  @override
  List<Object?> get props => [
        "id: $id",
        "name: $name",
        "jenis_user: $jenisUser",
        "email: $email",
        "level: $level",
        "path_foto: $pathFoto",
        "access_token: $accessToken",
        "token_type: $tokenType",
        "expires_in: $expiresIn",
        "nik: $nik",
      ];
}
