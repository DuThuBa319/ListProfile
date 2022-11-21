// To parse this JSON data, do
//
//     final profiles = profilesFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Profiles> profilesFromMap(String str) =>
    List<Profiles>.from(json.decode(str).map((x) => Profiles.fromMap(x)));

String profilesToMap(List<Profiles> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Profiles {
  Profiles({
    required this.id,
    required this.age,
    required this.job,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });

  int id;
  dynamic age;
  String job;
  String name;
  String email;
  String phone;
  String address;

  factory Profiles.fromMap(Map<String, dynamic> json) => Profiles(
        id: json["id"],
        age: json["age"],
        job: json["job"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "age": age,
        "job": job,
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
      };
}
