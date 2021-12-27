import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:poopy/friendspage.dart';
import 'package:poopy/somepage.dart';

///   return PageView(controller: controller, children: []);
class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

int _selectedIndex = 1;

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  final PageController _pageController = PageController(initialPage: 0);

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(52.217034, 20.987390),
    zoom: 19,
  );

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      const FriendsPage(),
      GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      const SomePage()
    ];

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 55),
          width: 80,
          height: 80,
          child: SpeedDial(
            foregroundColor: Colors.white,
            overlayColor: Colors.white10,
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 105, 30, 0),
            childrenButtonSize: (const Size.square(100)),
            direction: SpeedDialDirection.left,
            child: const Icon(
              Icons.add,
              size: 48,
            ),
            children: [
              SpeedDialChild(
                backgroundColor: const Color.fromARGB(190, 105, 30, 1),
                child: const Icon(
                  Icons.ac_unit_sharp,
                  size: 40,
                ),
              ),
            ],
          )),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 105, 30, 1),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Znajomi',
              backgroundColor: Color.fromARGB(190, 105, 30, 1),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.map),
              label: 'Mapa',
              backgroundColor: Color.fromARGB(210, 105, 30, 1),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.crown),
              label: 'Ranking',
              backgroundColor: Color.fromARGB(190, 105, 30, 1),
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          showSelectedLabels: false,
          iconSize: 38,
          onTap: _onItemTap,
          elevation: 0),
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(210, 105, 30, 1),
        title: Text(
          "poopy",
          style: GoogleFonts.overpass(
              fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: screens[_selectedIndex],
    );
  }
}
