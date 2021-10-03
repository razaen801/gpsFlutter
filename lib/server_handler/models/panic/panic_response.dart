// To parse this JSON data, do
//
//     final panicResponse = panicResponseFromJson(jsonString);

import 'dart:convert';

PanicResponse panicResponseFromJson(String str) => PanicResponse.fromJson(json.decode(str));

String panicResponseToJson(PanicResponse data) => json.encode(data.toJson());

class PanicResponse {
  PanicResponse({
    required this.result,
    required this.panics,
  });

  String result;
  List<Panic> panics;

  factory PanicResponse.fromJson(Map<String, dynamic> json) => PanicResponse(
    result: json["result"],
    panics: List<Panic>.from(json["panics"].map((x) => Panic.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "panics": List<dynamic>.from(panics.map((x) => x.toJson())),
  };
}

class Panic {
  Panic({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.location,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
  });

  int id;
  String name;
  String phone;
  String email;
  String location;
  String? image;
  DateTime createdAt;
  DateTime updatedAt;
  String type;

  factory Panic.fromJson(Map<String, dynamic> json) => Panic(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    location: json["location"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "email": email,
    "location": location,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "type": type,
  };
}
