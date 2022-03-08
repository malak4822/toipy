import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poopy/provider.dart';
import 'package:provider/provider.dart';

class SaveBoxes extends ChangeNotifier {
  final imieContr = TextEditingController();
  final surNameCont = TextEditingController();

  void showNameAction(BuildContext context) {
    String imie = Provider.of<ZmienneClass>(context, listen: false).imie;

    showDialog<void>(
      context: context,
      barrierColor: Colors.black.withOpacity(0.8),
      builder: (context) {
        return AlertDialog(
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            backgroundColor: const Color.fromARGB(255, 130, 83, 60),
            content: TextField(
                controller: imieContr,
                style: GoogleFonts.overpass(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
                cursorWidth: 6,
                cursorRadius: const Radius.circular(4),
                cursorColor: Colors.white,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: imie,
                    hintStyle: GoogleFonts.overpass(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold))),
            actions: [
              Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            child: const Icon(Icons.close, size: 40),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.brown.withRed(130),
                                side: const BorderSide(
                                    width: 1, color: Colors.white),
                                padding: const EdgeInsets.all(10)),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        ElevatedButton(
                            child: const Icon(Icons.done, size: 40),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.brown.withGreen(110),
                                side: const BorderSide(
                                    width: 1, color: Colors.white),
                                padding: const EdgeInsets.all(10)),
                            onPressed: () {
                              Provider.of<ZmienneClass>(context, listen: false)
                                  .setImie(imieContr.text);
                              Navigator.pop(context);
                              print(imieContr.text);
                            }),
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
            contentTextStyle: GoogleFonts.overpass(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
            contentPadding: EdgeInsets.all(0),
            elevation: 0,
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            backgroundColor: Colors.brown,
            content: TextField(
                controller: surNameCont,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            child: const Icon(Icons.close, size: 40),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.brown.withRed(130),
                                side: const BorderSide(
                                    width: 1, color: Colors.white),
                                padding: const EdgeInsets.all(10)),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        ElevatedButton(
                            child: const Icon(Icons.done, size: 40),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.brown.withGreen(110),
                                side: const BorderSide(
                                    width: 1, color: Colors.white),
                                padding: const EdgeInsets.all(10)),
                            onPressed: () {
                              Provider.of<ZmienneClass>(context, listen: false)
                                  .setSurname(surNameCont.text);
                              Navigator.pop(context);
                              print(imieContr.text);
                            }),
                      ]))
            ]);
      },
    );
  }
}
