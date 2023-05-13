import 'package:equatable/equatable.dart';

class DeleteFaqModel extends Equatable {
  final int? code;
  final String? message;
  final dynamic data;

  const DeleteFaqModel({
    this.code,
    this.message,
    this.data,
  });

  factory DeleteFaqModel.fromJson(Map<String, dynamic> json) => DeleteFaqModel(
        code: json["code"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data,
      };

  @override
  List<Object?> get props => [
        "code: $code",
        "message: $message",
        "data: $data",
      ];
}
