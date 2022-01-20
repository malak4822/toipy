import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FriendsPageEditable extends StatefulWidget {
  const FriendsPageEditable({Key? key}) : super(key: key);

  @override
  _FriendsPageEditableState createState() => _FriendsPageEditableState();
}

class _FriendsPageEditableState extends State<FriendsPageEditable> {
  void _showAction(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierColor: Colors.black.withOpacity(0.8),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 157, 83, 83),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _showAction(context);
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
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showAction(context);
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
                                "Kamil Malak Don Kiszonito",
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
                                  color: Colors.white, size: 40),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      GestureDetector(
                          onTap: () {
                            _showAction(context);
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
                                  child: Text(
                                      "Iure doloremque provident eum culpa rerum qui expedita amet. Rerum quis doloremque laboriosam iste facilis occaecati nemo.",
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
