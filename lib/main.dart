import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poopy/mapage.dart';
import 'package:poopy/registerPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poppy App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(),
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

bool _isPasswordVisible = true;

double _wysokosc = 80;
double _secwysokosc = 80;
double _morewysokosc = 100;
double _moresecwysokosc = 100;

double _initialHeight = 150;
double _initialImageHeight = _initialHeight;
double _expandedImageHeight = 180;

double _loginButtonVisibility = 0;
double _borderwidth = 0.2;

class _MyHomePageState extends State<MyHomePage> {
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

  void increasingLoginVis() {
    setState(() {
      _loginButtonVisibility = _loginButtonVisibility + 0.025;
    });
  }

  void increasingBorder() {
    if (_borderwidth >= 2) {
      return;
    } else {
      _borderwidth = _borderwidth + 0.05;
    }
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
            curve: Curves.ease,
            height: _wysokosc,
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
                      onFocusChange: (hasFocus) {
                        setState(() {
                          if (_wysokosc == _morewysokosc) {
                            _wysokosc = _wysokosc - 25;
                          } else {
                            _wysokosc = _morewysokosc;
                          }
                        });
                      },
                      child: TextFormField(
                        onChanged: (a) {
                          if (_loginButtonVisibility >= 0.5) {
                            return;
                          } else {
                            increasingLoginVis();
                            increasingBorder();
                          }
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
                    onFocusChange: (a) {
                      setState(() {
                        if (_secwysokosc == _moresecwysokosc) {
                          _secwysokosc = _secwysokosc - 25;
                        } else {
                          _secwysokosc = _moresecwysokosc;
                        }
                      });
                    },
                    child: TextFormField(
                      onChanged: (a) {
                        if (_loginButtonVisibility >= 0.96) {
                          return;
                        }
                        increasingLoginVis();
                        increasingBorder();
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
                animationDirection: const AnimationDirection.reverse(),
                size: 32,
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                duration: const Duration(milliseconds: 400),
                splashColor: Colors.transparent,
                icons: const <AnimatedIconItem>[
                  AnimatedIconItem(
                    icon: Icon(Icons.remove_red_eye_outlined,
                        color: Colors.white),
                  ),
                  AnimatedIconItem(
                    icon: Icon(Icons.remove_red_eye, color: Colors.white),
                  ),
                ],
              )
            ])),
        const SizedBox(height: 10.0),
      ]);
/////////////////////////// POLA LOGOWANIA SIĘ ///////////////////////////////

  Widget mediasilogin() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
              curve: Curves.bounceIn,
              duration: const Duration(milliseconds: 500),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const mapPage()));
                  },
                  style: ElevatedButton.styleFrom(
                      side:
                          BorderSide(color: Colors.white, width: _borderwidth),
                      primary: const Color.fromARGB(210, 105, 30, 1)
                          .withOpacity(_loginButtonVisibility),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(15)),
                  child: Center(
                      child: Text(
                    "Login",
                    style: GoogleFonts.overpass(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w200),
                  )))),
          const SizedBox(width: 10.0),
          AnimatedContainer(
              curve: Curves.bounceIn,
              duration: const Duration(milliseconds: 500),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                  },
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Colors.white, width: 2),
                      primary:
                          const Color.fromARGB(210, 105, 30, 1).withOpacity(1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(15)),
                  child: Center(
                      child: Text(
                    "Register",
                    style: GoogleFonts.overpass(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w200),
                  ))))
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(139, 69, 19, 1),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 80),
            logo(),
            fields(),
            mediasilogin(),
          ],
        ),
      ),
    );
  }
}
