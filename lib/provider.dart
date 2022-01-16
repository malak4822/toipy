import 'package:flutter/material.dart';

class ZmienneClass extends ChangeNotifier {
  late final AnimationController _controller;
  bool _open = false;

  void _toggle() {
    _open = !_open;
    if (_open) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }
}
