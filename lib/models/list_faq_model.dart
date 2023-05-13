import 'package:equatable/equatable.dart';

class ListFaqModel extends Equatable {
  final int? code;
  final String? message;
  final List<Data>? data;
  final Pagination? pagination;

  const ListFaqModel({
    this.code,
    this.message,
    this.data,
    this.pagination,
  });

  factory ListFaqModel.fromJson(Map<String, dynamic> json) => ListFaqModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };

  @override
  List<Object?> get props => [
        "code: $code",
        "message: $message",
        "data: ${data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson()))}",
        "pagination: ${pagination?.toJson()}",
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
        "created_at: ${createdAt?.toIso8601String()}",
        "updated_at: ${updatedAt?.toIso8601String()}",
      ];
}

class Pagination extends Equatable {
  final int? currentPage;
  final int? totalRows;

  const Pagination({
    this.currentPage,
    this.totalRows,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json["current_page"],
        totalRows: json["total_rows"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "total_rows": totalRows,
      };

  @override
  List<Object?> get props => [
        "current_page: $currentPage",
        "total_rows: $totalRows",
      ];
}
