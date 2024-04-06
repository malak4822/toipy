import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:poopy/provider.dart';
import 'package:poopy/saveboxes.dart';
import 'package:provider/provider.dart';

class FriendsPageEditable extends StatefulWidget {
  const FriendsPageEditable({Key? key}) : super(key: key);

  @override
  _FriendsPageEditableState createState() => _FriendsPageEditableState();
}

class _FriendsPageEditableState extends State<FriendsPageEditable> {
  Widget bottomLine() {
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add_a_photo_rounded,
                color: Colors.white,
                size: 50,
              ),
              Text(
                "Add Photo",
                style: GoogleFonts.overpass(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                (Icons.camera),
                color: Colors.white,
                size: 50,
              ),
              Text("Make Photo",
                  style: GoogleFonts.overpass(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))
            ],
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String imie = Provider.of<ZmienneClass>(context).imie;
    String opis = Provider.of<ZmienneClass>(context).opis;

    SaveBoxes showName = Provider.of<SaveBoxes>(context, listen: false);
    SaveBoxes showDesc = Provider.of<SaveBoxes>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 130, 83, 60),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.brown,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(80))),
                        context: context,
                        builder: ((builder) => bottomLine()));
                  },
                  child: CircleAvatar(
                    radius: 72,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: const AssetImage("img/logo.png"),
                      backgroundColor: Colors.white,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.5)),
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
                  //builder: (context) => const FriendsPageEditable()
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showName.showNameAction(context);
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.1),
                              ),
                              child: Text(
                                imie,
                                softWrap: true,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: GoogleFonts.overpass(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 35,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            const Center(
                              child: Icon(Icons.border_color,
                                  color: Colors.white, size: 35),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      GestureDetector(
                          onTap: () {
                            showDesc.showDescAction(context);
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              const Center(
                                child: Icon(Icons.border_color,
                                    color: Colors.white, size: 40),
                              ),
                              Container(
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white.withOpacity(0.2)),
                                  child: Text(opis,
                                      maxLines: 4,
                                      style: GoogleFonts.overpass(
                                          color: Colors.white.withOpacity(0.5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w200)))
                            ],
                          ))
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
