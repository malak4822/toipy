import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poopy/friendspageeditable.dart';
import 'package:poopy/provider.dart';
import 'package:provider/provider.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  double _turns = 0;

  void animacja() {
    setState(() {
      _turns += 1 / 6;
    });
  }

  bool buttonClicked = false;

  @override
  Widget build(BuildContext context) {
    String imie = Provider.of<ZmienneClass>(context).imie;
    String opis = Provider.of<ZmienneClass>(context).opis;
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 220,
        width: 60,
        child: AnimatedRotation(
          duration: const Duration(milliseconds: 1000),
          turns: _turns,
          child: FloatingActionButton(
              onPressed: () async {
                // Then check if the button has been clicked
                if (!buttonClicked) {
                  buttonClicked = true;
                } else {
                  return;
                }

                animacja();
                await Future.delayed(const Duration(milliseconds: 1000), () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FriendsPageEditable()));
                });
                buttonClicked = !buttonClicked;
              },
              elevation: 0,
              highlightElevation: 0,
              child: const Icon(
                Icons.settings,
                size: 40,
                color: Color.fromARGB(255, 155, 108, 77),
              ),
              backgroundColor: Colors.white),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 155, 108, 77),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 72,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("img/logo.png"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        imie,
                        softWrap: true,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.overpass(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(opis,
                          maxLines: 4,
                          style: GoogleFonts.overpass(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w200))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
