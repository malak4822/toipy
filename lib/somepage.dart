import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SomePage extends StatefulWidget {
  const SomePage({Key? key}) : super(key: key);

  @override
  _SomePageState createState() => _SomePageState();
}

class _SomePageState extends State<SomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 155, 108, 77),
      child: const Center(
        child: FaIcon(
          FontAwesomeIcons.crown,
          color: Colors.white,
          size: 120,
        ),
      ),
    );
  }
}
