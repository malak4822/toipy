import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FriendsPageEditable extends StatefulWidget {
  const FriendsPageEditable({Key? key}) : super(key: key);

  @override
  _FriendsPageEditableState createState() => _FriendsPageEditableState();
}

class _FriendsPageEditableState extends State<FriendsPageEditable> {
  double _turns = 0;
  void animacja() {
    setState(() {
      _turns += 1 / 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 30,
            child: FloatingActionButton(
              onPressed: () => {},
              backgroundColor: Colors.black,
              child: const Icon(Icons.block_flipped),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () => {},
              backgroundColor: Colors.black,
              child: const Icon(Icons.check),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(190, 105, 50, 1),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage("img/logo.png"),
                    backgroundColor: Colors.white,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    width: 140,
                    height: 140,
                  ),
                  Positioned(
                    top: 25,
                    left: 25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.photo,
                          color: Colors.black,
                          size: 50,
                        ),
                        Text("Upload Image",
                            style: GoogleFonts.overpass(
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(0.3),
                          ),
                          child: Text(
                            "Kamil Malak",
                            softWrap: true,
                            style: GoogleFonts.overpass(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      const Center(
                        child: Icon(Icons.border_color,
                            color: Colors.white, size: 30),
                      ),
                    ],
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
