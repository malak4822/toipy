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
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("img/logo.png"),
              ),
              Column(
                children: [
                  SizedBox(
                    child: Text(
                      "Kamil Malak",
                      style: GoogleFonts.overpass(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                      width: 200,
                      child: Text(
                          "Iure doloremque provident eum culpa rerum qui expedita amet. Rerum quis doloremque laboriosam iste facilis occaecati nemo.",
                          style: GoogleFonts.overpass(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w200)))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
