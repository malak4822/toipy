import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:poopy/expandablefab.dart';
import 'package:poopy/friendspage.dart';
import 'package:poopy/somepage.dart';

@immutable
class MapSample extends StatefulWidget {
  const MapSample({
    Key? key,
  }) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

int _selectedIndex = 1;
bool _isMenuShown = true;

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(52.217034, 20.987390),
    zoom: 1,
  );

  final Set<Marker> _markers = {};
  late BitmapDescriptor mapMarker;

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "img/markerlogo1.png",
    );
  }

  LatLng? currentLocation;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    setCustomMarker();
  }

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentLocation = LatLng(position.latitude, position.longitude);
    //    var lastPosition = await Geolocator.getLastKnownPosition();

    //   print(lastPosition);
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void buttonDissapearing(index) {
    if (index == 1) {
      _isMenuShown = true;
    } else {
      _isMenuShown = false;
    }
  }

  bool _addingOption = false;

  @override
  Widget build(BuildContext context) {
    void _showAction(BuildContext context, int index) {
      showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "localpoop",
              style:
                  GoogleFonts.lemon(fontWeight: FontWeight.bold, fontSize: 30),
              textAlign: TextAlign.center,
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            contentTextStyle: GoogleFonts.overpass(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w300),
            backgroundColor: Colors.brown,
            content: const Text("Essa"),
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
      Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: true,
            myLocationEnabled: true,
            markers: _markers,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              _markers.add(Marker(
                  icon: mapMarker,
                  markerId: const MarkerId("marker-1"),
                  position: currentLocation ?? LatLng(0, 0)));
            },
          ),
          Visibility(
            visible: _addingOption,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4.0,
                sigmaY: 4.0,
              ),
              child: Container(
                color: Colors.white.withOpacity(0.3),
              ),
            ),
          ),
        ],
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
                icon: const FaIcon(FontAwesomeIcons.mapMarkedAlt, size: 30),
              ),
            ),
            SizedBox(
                width: 80,
                height: 80,
                child: ActionButton(
                  onPressed: () {
                    setState(() {
                      _addingOption = !_addingOption;
                      //_toggle();
                    });
                  },
                  icon:
                      const FaIcon(FontAwesomeIcons.envelopeOpenText, size: 30),
                )),
            SizedBox(
              width: 80,
              height: 80,
              child: ActionButton(
                onPressed: () {
                  getCurrentLocation();
                  print(currentLocation);
                },
                icon: const FaIcon(Icons.favorite_outline_rounded, size: 30),
              ),
            ),
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
              buttonDissapearing(index);
              _onItemTap(index);
            },
            elevation: 0),
      ),
      body: screens[_selectedIndex],
    );
  }
}
