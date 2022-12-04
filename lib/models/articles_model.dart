// To parse this JSON data, do
//
//     final articlesModel = articlesModelFromJson(jsonString);

import 'package:my_apps/models/created_model.dart';

class ArticlesModel {
  ArticlesModel({
    required this.code,
    required this.status,
    required this.message,
    required this.articles,
  });

  final int code;
  final bool status;
  final String message;
  final List<Article> articles;

  factory ArticlesModel.fromJson(Map<String, dynamic> json) => ArticlesModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    required this.uuid,
    required this.title,
    required this.content,
    required this.image,
    required this.views,
    required this.created,
    required this.user,
  });

  final String uuid;
  final String title;
  final String content;
  final String image;
  final int views;
  final Created created;
  final User user;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        uuid: json["uuid"],
        title: json["title"],
        content: json["content"],
        image: json["image"],
        views: json["views"],
        created: Created.fromJson(json["created"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "title": title,
        "content": content,
        "image": image,
        "views": views,
        "created": created.toJson(),
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

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
