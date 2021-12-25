import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(190, 105, 30, 1),
      child: const Center(
          child: Icon(
        Icons.person,
        color: Colors.white,
        size: 120,
      )),
    );
  }
}
