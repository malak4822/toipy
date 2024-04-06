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

  String imie = "Adam Mickiewicz";
  String opis =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a a type specimen book";
}
