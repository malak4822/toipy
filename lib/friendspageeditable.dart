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
      backgroundColor: const Color.fromARGB(190, 105, 30, 1),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    int index = 2;
                    void _showAction(BuildContext context, int index) {
                      showDialog<void>(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text(
                              "essa",
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                      );
                    }

                    _showAction(context, index);
                  },
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: const AssetImage("img/logo.png"),
                    backgroundColor: Colors.white,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.55)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.photo,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text("Upload Image",
                              style: GoogleFonts.overpass(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.3),
                            ),
                            child: Text(
                              "Kamil Malak essa kurwa",
                              softWrap: true,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: GoogleFonts.overpass(
                                  color: Colors.black,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          const Center(
                            child: Icon(Icons.border_color,
                                color: Colors.white, size: 30),
                          ),
                        ],
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber.withOpacity(0.3)),
                          child: Text(
                              "Iure doloremque provident eum culpa rerum qui expedita amet. Rerum quis doloremque laboriosam iste facilis occaecati nemo.",
                              style: GoogleFonts.overpass(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w200)))
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
