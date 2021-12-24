import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poopy/mapage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

bool _isPasswordVisible = true;

double wysokosc = 80;
double secwysokosc = 80;
double thirdwysokosc = 80;

double morewysokosc = 100;
double moresecwysokosc = 100;
double morethirdwysokosc = 100;

double initialHeight = 150;
double initialImageHeight = initialHeight;
double expandedImageHeight = 180;

double loginButtonVisibility = 0.01;
double secloginButtonVisibility = 0;

class _RegisterPageState extends State<RegisterPage> {
  void increasingLoginVis() {
    setState(() {
      loginButtonVisibility = loginButtonVisibility + 0.025;
    });
  }

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
////////////////////////////// LOGO ////////////////////////////

  Widget logo() => GestureDetector(
        onTap: () async {
          poopAnimationIn();
        },
        child: AnimatedContainer(
          height: initialImageHeight,
          curve: Curves.bounceInOut,
          duration: const Duration(milliseconds: 190),
          child: Image.asset("img/logo.png"),
        ),
      );

//////////////////////// POLA TEKSTOWE DO WPISYWANIA /////////////////////////
  Widget fields() => Column(children: [
        AnimatedContainer(
            curve: Curves.ease,
            height: thirdwysokosc,
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.greenAccent, width: 1.5),
                color: const Color.fromARGB(210, 105, 30, 1),
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.person, size: 40.0, color: Colors.greenAccent),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Focus(
                      onFocusChange: (a) {
                        setState(() {
                          if (thirdwysokosc == morethirdwysokosc) {
                            thirdwysokosc = thirdwysokosc - 25;
                          } else {
                            thirdwysokosc = morethirdwysokosc;
                          }
                        });
                      },
                      child: TextFormField(
                        onChanged: (b) {
                          if (loginButtonVisibility >= 0.33) {
                            return;
                          } else {
                            increasingLoginVis();
                          }
                        },
                        style: GoogleFonts.overpass(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        cursorWidth: 10,
                        cursorHeight: 14,
                        cursorRadius: const Radius.circular(20),
                        cursorColor: Colors.greenAccent,
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
            curve: Curves.ease,
            height: wysokosc,
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.greenAccent, width: 1.5),
                color: const Color.fromARGB(210, 105, 30, 1),
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.email_outlined,
                    size: 40.0, color: Colors.greenAccent),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Focus(
                      onFocusChange: (c) {
                        setState(() {
                          if (wysokosc == morewysokosc) {
                            wysokosc = wysokosc - 25;
                          } else {
                            wysokosc = morewysokosc;
                          }
                        });
                      },
                      child: TextFormField(
                        onChanged: (d) {
                          if (loginButtonVisibility >= 0.66) {
                            return;
                          } else {
                            increasingLoginVis();
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
                        cursorColor: Colors.greenAccent,
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
                border: Border.all(color: Colors.greenAccent, width: 1.5),
                color: const Color.fromARGB(210, 105, 30, 1),
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Icon(Icons.vpn_key, size: 35, color: Colors.greenAccent),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Focus(
                    onFocusChange: (e) {
                      setState(() {
                        if (secwysokosc == moresecwysokosc) {
                          secwysokosc = secwysokosc - 25;
                        } else {
                          secwysokosc = moresecwysokosc;
                        }
                      });
                    },
                    child: TextFormField(
                      onChanged: (f) {
                        if (loginButtonVisibility >= 0.975) {
                          return;
                        }
                        increasingLoginVis();
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
                      cursorColor: Colors.greenAccent,
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
                        color: Colors.greenAccent),
                  ),
                  AnimatedIconItem(
                    icon: Icon(Icons.remove_red_eye, color: Colors.greenAccent),
                  ),
                ],
              )
            ])),
        const SizedBox(height: 10.0),
      ]);

//////////////////////// POLE REJESTRACJI I PRZYCISK //////////////////////

  Widget registerButton() => Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MapSample()));
          },
          style: ElevatedButton.styleFrom(
              side: const BorderSide(color: Colors.greenAccent, width: 1.5),
              primary: const Color.fromARGB(210, 105, 30, 1)
                  .withOpacity(loginButtonVisibility),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(20)),
          child: Center(
              child: Text(
            "Zarejestruj się",
            style: GoogleFonts.overpass(
                fontSize: 30.0,
                color: Colors.greenAccent,
                fontWeight: FontWeight.w200),
          ))));

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
          registerButton(),
        ],
      ),
    ));
  }
}
