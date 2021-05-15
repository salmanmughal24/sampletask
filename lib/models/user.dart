// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.name,
    this.email,
    this.photo,
  });

  String name;
  String email;
  String photo;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "photo": photo,
  };
}
