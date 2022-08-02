import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ZmienneClass extends ChangeNotifier {
  static late SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  void setImie(String noweimie) {
    imie = noweimie;
    notifyListeners();
  }

  void setSurname(String noweNazwisko) {
    opis = noweNazwisko;
    notifyListeners();
  }

  String imie = "Kamil Malak";
  String opis =
      "Jo, jestem kamil i to jest mój testowy profil użytkownika, pisze te słowa bez sensu trochę ale bywa, nic na to nie poradzę";
}
