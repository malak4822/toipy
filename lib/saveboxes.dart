import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poopy/provider.dart';
import 'package:provider/provider.dart';

class SaveBoxes extends ChangeNotifier {
  void showNameAction(BuildContext context) {
    String imie = Provider.of<ZmienneClass>(context, listen: false).imie;

    showDialog<void>(
      context: context,
      barrierColor: Colors.black.withOpacity(0.8),
      builder: (context) {
        return AlertDialog(
            elevation: 0,
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            backgroundColor: Colors.brown,
            content: TextField(
                style: GoogleFonts.overpass(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
                cursorWidth: 10,
                cursorRadius: const Radius.circular(10),
                cursorColor: Colors.white,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: imie,
                    hintStyle: GoogleFonts.overpass(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold))),
            actions: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            child: Text(
                              "Odrzuć",
                              style: GoogleFonts.overpass(fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.brown.withRed(130),
                                side: const BorderSide(
                                    width: 1, color: Colors.white),
                                padding: const EdgeInsets.all(10)),
                            onPressed: () {}),
                        ElevatedButton(
                            child: Text(
                              "Zapisz",
                              style: GoogleFonts.overpass(fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.brown.withGreen(110),
                                side: const BorderSide(
                                    width: 1, color: Colors.white),
                                padding: const EdgeInsets.all(10)),
                            onPressed: () {}),
                      ]))
            ]);
      },
    );
    notifyListeners();
  }

  void showDescAction(BuildContext context) {
    String opis = Provider.of<ZmienneClass>(context, listen: false).opis;

    showDialog<void>(
      context: context,
      barrierColor: Colors.black.withOpacity(0.8),
      builder: (context) {
        return AlertDialog(
            elevation: 0,
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            backgroundColor: Colors.brown,
            content: TextField(
                style: GoogleFonts.overpass(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
                cursorWidth: 10,
                cursorHeight: 14,
                cursorRadius: const Radius.circular(20),
                cursorColor: Colors.white,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: opis,
                    hintStyle: GoogleFonts.overpass(
                      color: Colors.white,
                      fontSize: 20.0,
                    ))),
            actions: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            child: Text(
                              "Odrzuć",
                              style: GoogleFonts.overpass(fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.brown.withRed(130),
                                side: const BorderSide(
                                    width: 1, color: Colors.white),
                                padding: const EdgeInsets.all(10)),
                            onPressed: () {}),
                        ElevatedButton(
                            child: Text(
                              "Zapisz",
                              style: GoogleFonts.overpass(fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.brown.withGreen(110),
                                side: const BorderSide(
                                    width: 1, color: Colors.white),
                                padding: const EdgeInsets.all(10)),
                            onPressed: () {}),
                      ]))
            ]);
      },
    );
  }
}
