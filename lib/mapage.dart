import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:poopy/friendspage.dart';
import 'package:poopy/registerPage.dart';
import 'package:poopy/somepage.dart';

///   return PageView(controller: controller, children: []);
class MapSample extends StatefulWidget {
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
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
          iconSize: 40,
          onTap: _onItemTap,
          elevation: 5),
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
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 40,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 40,
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ],
      ),
    );
  }
}
