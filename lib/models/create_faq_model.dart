import 'package:equatable/equatable.dart';

class CreateFaqModel extends Equatable {
  final int? code;
  final String? message;
  final Data? data;

  const CreateFaqModel({
    this.code,
    this.message,
    this.data,
  });

  factory CreateFaqModel.fromJson(Map<String, dynamic> json) => CreateFaqModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
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

class Data extends Equatable {
  final String? pertanyaan;
  final String? jawaban;
  final bool? statusPublish;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  const Data({
    this.pertanyaan,
    this.jawaban,
    this.statusPublish,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pertanyaan: json["pertanyaan"],
        jawaban: json["jawaban"],
        statusPublish: json["status_publish"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "pertanyaan": pertanyaan,
        "jawaban": jawaban,
        "status_publish": statusPublish,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };

  @override
  List<Object?> get props => [
        "pertanyaan: $pertanyaan",
        "jawaban: $jawaban",
        "status_publish: $statusPublish",
        "updated_at: ${updatedAt?.toIso8601String()}",
        "created_at: ${createdAt?.toIso8601String()}",
        "id: $id",
      ];
}
