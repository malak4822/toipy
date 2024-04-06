import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poopy/mapage.dart';
import 'package:poopy/provider.dart';
import 'package:poopy/saveboxes.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ZmienneClass.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ZmienneClass(),
        ),
        ChangeNotifierProvider(
          create: (context) => SaveBoxes(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Poppy App',
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

var myFocusNode = FocusNode();

bool _isPasswordVisible = true;

double _initialHeight = 150;
double _initialImageHeight = _initialHeight;
double _expandedImageHeight = 180;

double _wysokosc = 70;
double _secwysokosc = 70;

double _loginButtonVisibility = 0;
double _borderwidth = 0.0;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color.fromARGB(155, 69, 19, 1),
      child: ListView(
        children: <Widget>[
          const SizedBox(height: 80),
          logo(),
          fields(),
          mediasilogin(),
        ],
      ),
    ));
  }

  void poopAnimationIn() async {
    setState(() {
      _initialImageHeight = _expandedImageHeight;
    });
    await Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _initialImageHeight = _initialHeight;
      });
    });
  }

//////////////////////////// LOGO ////////////////////////////////////////////
  Widget logo() => GestureDetector(
        onTap: () async {
          poopAnimationIn();
        },
        child: AnimatedContainer(
          height: _initialImageHeight,
          curve: Curves.bounceInOut,
          duration: const Duration(milliseconds: 190),
          child: Image.asset("img/logo1.png"),
        ),
      );
//////////////////////////// POLA TEKSTOWE ///////////////////////////////////
  Widget fields() => Column(children: [
        AnimatedContainer(
            height: _wysokosc,
            curve: Curves.ease,
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.5),
                color: const Color.fromARGB(210, 105, 30, 1),
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.email_outlined,
                    size: 40.0, color: Colors.white),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Focus(
                      debugLabel: "1",
                      onFocusChange: (a) {
                        print("first");
                      },
                      child: TextFormField(
                        onFieldSubmitted: (c) {
                          print("sraka ");
                          myFocusNode.requestFocus();
                        },
                        onChanged: (d) {
                          setState(() {
                            if (_loginButtonVisibility <= 0.5) {
                              _loginButtonVisibility =
                                  _loginButtonVisibility + 0.0625;
                            }
                            if (_borderwidth <= 0.9375) {
                              _borderwidth = _borderwidth + 0.125;
                            }
                          });
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: GoogleFonts.overpass(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        cursorWidth: 10,
                        cursorHeight: 14,
                        cursorRadius: const Radius.circular(20),
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        AnimatedContainer(
            height: _secwysokosc,
            curve: Curves.ease,
            duration: (const Duration(milliseconds: 300)),
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.5),
                color: const Color.fromARGB(210, 105, 30, 1),
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Icon(Icons.vpn_key, size: 35, color: Colors.white),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Focus(
                    focusNode: myFocusNode,
                    debugLabel: "2",
                    onFocusChange: (b) {
                      print("aye");
                    },
                    child: TextFormField(
                      onChanged: (j) {
                        setState(() {
                          if (_loginButtonVisibility <= 0.9375) {
                            _loginButtonVisibility =
                                _loginButtonVisibility + 0.0625;
                          }
                          if (_borderwidth <= 1.875) {
                            _borderwidth = _borderwidth + 0.125;
                          }
                        });
                      },
                      style: GoogleFonts.overpass(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      obscureText: _isPasswordVisible,
                      autocorrect: false,
                      cursorWidth: 10,
                      cursorHeight: 14,
                      enableSuggestions: false,
                      cursorRadius: const Radius.circular(20),
                      cursorColor: Colors.white,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedIconButton(
                size: 24,
                animationDirection: const AnimationDirection.reverse(),
                onPressed: () async {
                  await Future.delayed(const Duration(milliseconds: 400), () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  });
                },
                duration: const Duration(milliseconds: 400),
                splashColor: Colors.transparent,
                icons: const <AnimatedIconItem>[
                  AnimatedIconItem(
                      icon: Icon(Icons.remove_red_eye_outlined,
                          color: Colors.white)),
                  AnimatedIconItem(
                    icon: Icon(Icons.remove_red_eye, color: Colors.white),
                  ),
                ],
              )
            ])),
        const SizedBox(height: 10.0),
      ]);
/////////////////////////// POLA LOGOWANIA SIĘ ///////////////////////////////

  Widget mediasilogin() => AnimatedContainer(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 90),
      curve: Curves.bounceIn,
      duration: const Duration(milliseconds: 500),
      child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MapSample()));
          },
          style: ElevatedButton.styleFrom(
              side: BorderSide(color: Colors.white, width: _borderwidth),
              backgroundColor: const Color.fromARGB(0, 115, 70, 10)
                  .withOpacity(_loginButtonVisibility),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "go ",
                style: GoogleFonts.overpass(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w200),
              ),
              const FaIcon(
                FontAwesomeIcons.walking,
                size: 20,
              ),
            ],
          )));
}
