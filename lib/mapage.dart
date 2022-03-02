import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:poopy/bottomAppBar.dart';
import 'package:poopy/expandablefab.dart';
import 'package:poopy/friendspage.dart';
import 'package:poopy/somepage.dart';

@immutable
class MapSample extends StatefulWidget {
  MapSample({
    Key? key,
  }) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(52.217034, 20.987390),
    zoom: 16,
  );

  final Set<Marker> _markers = {};
  late BitmapDescriptor mapMarker;

  var selectedindex = 0;

  var onChangedTab;

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "img/markerlogo1.png",
    );
  }

  LatLng? currentLocation;

  @override
  void initState() {
    getCurrentLocation();
    setCustomMarker();
    super.initState();
  }

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentLocation = LatLng(position.latitude, position.longitude);
    //    var lastPosition = await Geolocator.getLastKnownPosition();

    //   print(lastPosition);
  }

  int index = 0;
  bool _addingOption = false;

  @override
  Widget build(BuildContext context) {
    void _showAction(BuildContext context, int index) {
      showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Do Something",
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
            myLocationButtonEnabled: true,
            zoomControlsEnabled: false,
            markers: _markers,
            myLocationEnabled: true,
            mapType: MapType.terrain,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              _markers.add(Marker(
                  icon: mapMarker,
                  markerId: const MarkerId("marker-1"),
                  position: currentLocation ?? const LatLng(0, 0)));
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

//decoration: const BoxDecoration
//         border: Border(top: BorderSide(color: Colors.white, width: 10))),

    //   _isMenuShown = true;

    void onChangedTab(int index) {
      setState(() {
        this.index = index;
      });
    }

    return Scaffold(
      body: screens[index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Stack(alignment: Alignment.bottomCenter, children: [
        Visibility(
          //        visible: _isMenuShown,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: ExpandableFab(
              distance: 95.0,
              children: [
                //PRZYCISKI PRZYCISKI PRZYCISKI PRZYCISKI PRZYCISKI PRZYCISKI

                SizedBox.fromSize(
                  child: ActionButton(
                    onPressed: () {
                      setCustomMarker();
                      getCurrentLocation();
                    },
                    icon: const FaIcon(FontAwesomeIcons.mapPin, size: 30),
                  ),
                ),

                SizedBox.fromSize(
                  child: ActionButton(
                    onPressed: () {
                      setState(() {
                        _addingOption = !_addingOption;
                      });
                    },
                    icon: const FaIcon(FontAwesomeIcons.envelopeOpenText,
                        size: 30),
                  ),
                ),

                SizedBox.fromSize(
                  child: ActionButton(
                    onPressed: () => _showAction(context, 0),
                    icon: const FaIcon(FontAwesomeIcons.mapMarkedAlt, size: 30),
                  ),
                )
              ],
            ),
          ),
        ),
        Stack(alignment: AlignmentDirectional.bottomCenter, children: [
          Container(
              height: 80,
              decoration: const BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.white, width: 2))),
              child: BottomAppBarTab(
                index: index,
                onChangedTab: onChangedTab,
              ))
        ])
      ]),
    );
  }
}
