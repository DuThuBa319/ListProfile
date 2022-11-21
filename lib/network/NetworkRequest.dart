import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:login/src/model/employees.dart';

var url = 'https://retoolapi.dev/lVUrMy/employees';
Future<List<Profiles>> fetchProfile(dynamic searchString) async {
  var response = await http.get(Uri.parse(url));
  List<Profiles> searchProfiles = [];
  if (response.statusCode == 200) {
    searchProfiles = profilesFromMap(response.body);
    return searchProfiles
        .where((searchProfile) => searchProfile.name
            .toLowerCase()
            .contains(searchString.toString().toLowerCase()))
        .toList();
    // return compute(profilesFromMap, response.body);
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<Profiles>> updateProfile(
    {int? id,
    int? age,
    String? name,
    String? job,
    String? email,
    String? phone,
    String? address}) async {
  var response = await http.put(
    Uri.parse(url + '$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "id": id,
      "age": age,
      "job": job,
      "name": name,
      "email": email,
      "phone": phone,
      "address": address,
    }),
  );

  if (response.statusCode == 200) {
    return compute(profilesFromMap, response.body);
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<Profiles>> deleteProfile(int id) async {
  var response = await http.delete(
    Uri.parse(url + '$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return compute(profilesFromMap, response.body);
  } else if (response.statusCode == 410) {
    throw Exception('no file to delete');
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<Profiles>> createProfile(
    {int? id,
    int? age,
    String? job,
    String? name,
    String? email,
    String? phone,
    String? address}) async {
  var response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "id": id,
      "age": age,
      "job": job,
      "name": name,
      "email": email,
      "phone": phone,
      "address": address,
    }),
  );

  if (response.statusCode == 201) {
    return compute(profilesFromMap, response.body);
  } else {
    throw Exception('Failed to load album');
  }
}
