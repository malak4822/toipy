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
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.5),
                color: const Color.fromARGB(210, 105, 30, 1),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.email_outlined,
                    size: 40.0, color: Colors.white),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      style: GoogleFonts.overpass(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      cursorWidth: 10,
                      cursorHeight: 14,
                      cursorRadius: const Radius.circular(20),
                      cursorColor: Colors.white,
                      maxLines: 1,
                      decoration: InputDecoration(
                        label: Text(
                          " E-mail",
                          style: GoogleFonts.overpass(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            )),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.5),
                color: const Color.fromARGB(210, 105, 30, 1),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.vpn_key, size: 40.0, color: Colors.white),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
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
                      decoration: InputDecoration(
                        label: Text(
                          " Password",
                          style: GoogleFonts.overpass(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    icon: const Icon(Icons.remove_red_eye,
                        size: 30.0, color: Colors.white))
              ],
            ))
      ]);

  Widget mediasilogin() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(duration: const Duration(milliseconds: 500)),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(210, 105, 30, 1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                  padding: const EdgeInsets.all(20)),
              child: Center(
                  child: Text(
                "Login",
                style:
                    GoogleFonts.overpass(fontSize: 40.0, color: Colors.white),
              ))),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(139, 69, 19, 1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              logo(),
              fields(),
              mediasilogin(),
            ],
          ),
        ),
      ),
    );
  }
}
