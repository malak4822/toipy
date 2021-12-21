import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

double wysokosc = 80;
double secwysokosc = 80;
double morewysokosc = 100;
double moresecwysokosc = 100;

double initialHeight = 150;
double initialImageHeight = initialHeight;
double expandedImageHeight = 180;

class _MyHomePageState extends State<MyHomePage> {
  void poopAnimationIn() async {
    setState(() {
      initialImageHeight = expandedImageHeight;
    });
    await Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        initialImageHeight = initialHeight;
      });
    });
  }

//////////////////////////// LOGO ////////////////////////////////////////////
  Widget logo() => GestureDetector(
        onTap: () async {
          poopAnimationIn();
        },
        child: AnimatedContainer(
          height: initialImageHeight,
          curve: Curves.bounceInOut,
          duration: const Duration(milliseconds: 190),
          child: Image.asset("img/logo1.png"),
        ),
      );
//////////////////////////// POLA TEKSTOWE ///////////////////////////////////
  Widget fields() => Column(children: [
        AnimatedContainer(
            curve: Curves.ease,
            height: wysokosc,
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
                          if (wysokosc == morewysokosc) {
                            wysokosc = wysokosc - 25;
                          } else {
                            wysokosc = morewysokosc;
                          }
                        });
                      },
                      child: TextFormField(
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
            height: secwysokosc,
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
                        if (secwysokosc == moresecwysokosc) {
                          secwysokosc = secwysokosc - 25;
                        } else {
                          secwysokosc = moresecwysokosc;
                        }
                      });
                    },
                    child: TextFormField(
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Colors.white, width: 1.5),
                      primary: const Color.fromARGB(210, 105, 30, 1),
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Colors.white, width: 1.5),
                      primary: const Color.fromARGB(210, 105, 30, 1),
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
