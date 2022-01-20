import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poopy/friendspageeditable.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  double _turns = 0;
  void animacja() {
    setState(() {
      _turns += 1 / 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: AnimatedRotation(
          duration: const Duration(milliseconds: 250),
          turns: _turns,
          child: FloatingActionButton(
            onPressed: () async {
              animacja();
              await Future.delayed(const Duration(milliseconds: 250));
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FriendsPageEditable()));
            },
            elevation: 0,
            highlightElevation: 0,
            child: const Icon(
              Icons.settings,
              size: 40,
              color: Color.fromARGB(190, 105, 30, 1),
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(190, 105, 30, 1),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("img/logo.png"),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Błazej Normalny Brezeczyszykiewicz Kurwa szmato",
                        softWrap: true,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.overpass(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                          "Iure doloremque provident eum culpa rerum qui expedita amet. Rerum quis doloremque laboriosam iste facilis occaecati nemo.Iure doloremque provident eum culpa rerum qui expedita amet.",
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
