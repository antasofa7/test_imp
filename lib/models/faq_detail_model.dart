import 'package:equatable/equatable.dart';

class FaqDetailModel extends Equatable {
  final int? code;
  final String? message;
  final Data? data;

  const FaqDetailModel({
    this.code,
    this.message,
    this.data,
  });

  factory FaqDetailModel.fromJson(Map<String, dynamic> json) => FaqDetailModel(
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
  final int? id;
  final String? pertanyaan;
  final String? jawaban;
  final int? statusPublish;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Data({
    this.id,
    this.pertanyaan,
    this.jawaban,
    this.statusPublish,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        pertanyaan: json["pertanyaan"],
        jawaban: json["jawaban"],
        statusPublish: json["status_publish"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pertanyaan": pertanyaan,
        "jawaban": jawaban,
        "status_publish": statusPublish,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => [
        "id: $id",
        "pertanyaan: $pertanyaan",
        "jawaban: $jawaban",
        "status_publish: $statusPublish",
        "updated_at: ${updatedAt?.toIso8601String()}",
        "created_at: ${createdAt?.toIso8601String()}",
      ];
}
