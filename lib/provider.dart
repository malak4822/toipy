import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ZmienneClass extends ChangeNotifier {
  static late SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static const _keyUser = "user";

  String imie = "Kamil Malak";
  String opis =
      "Jo, jestem kamil i to jest mój testowy profil użytkownika, pisze te słowa bez sensu trochę ale bywa, nic na to nie poradzę";
}

class User {
  final String imagePath;
  final String name;
  final String about;

  User(this.imagePath, this.name, this.about);

  Map<String, dynamic> toJson() => {
        "imagePath": imagePath,
        "name": name,
        "about": about,
      };
}
