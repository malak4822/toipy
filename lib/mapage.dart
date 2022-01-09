import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:poopy/expandablefab.dart';
import 'package:poopy/friendspage.dart';
import 'package:poopy/somepage.dart';

@immutable
@immutable
class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

int _selectedIndex = 1;
bool _isMenuShown = true;

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  final PageController _pageController = PageController(initialPage: 0);

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(52.217034, 20.987390),
    zoom: 9,
  );

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void buttonDissapearing() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    void _showAction(BuildContext context, int index) {
      showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text("jd"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('CLOSE'),
              ),
            ],
          );
        },
      );
    }

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
      floatingActionButton: Visibility(
        visible: _isMenuShown,
        child: ExpandableFab(
          distance: 80.0,
          children: [
            SizedBox(
                width: 80,
                height: 80,
                child: ActionButton(
                  onPressed: () => _showAction(context, 0),
                  icon: const Icon(Icons.format_size),
                )),
            SizedBox(
                width: 80,
                height: 80,
                child: ActionButton(
                  onPressed: () => _showAction(context, 1),
                  icon: const Icon(Icons.insert_photo),
                )),
            SizedBox(
                width: 80,
                height: 80,
                child: ActionButton(
                  onPressed: () => _showAction(context, 2),
                  icon: const Icon(Icons.videocam),
                )),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.white, width: 2))),
        child: BottomNavigationBar(
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
            onTap: (int index) {
              buttonDissapearing();
              _onItemTap(index);
            },
            elevation: 0),
      ),
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
