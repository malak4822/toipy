import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomAppBarTab extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;
  final Function buttonDissapearing;

  const BottomAppBarTab({
    Key? key,
    required this.buttonDissapearing,
    required this.index,
    required this.onChangedTab,
  }) : super(key: key);

  @override
  _BottomAppBarTabState createState() => _BottomAppBarTabState();
}

class _BottomAppBarTabState extends State<BottomAppBarTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(220, 135, 108, 90),
          Color.fromARGB(255, 69, 29, 1),
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        child: BottomAppBar(
            elevation: 0,
            color: Colors.transparent,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  buildTapItem(index: 0, icon: const Icon(Icons.person)),
                  buildTapItem(
                      index: 1, icon: const Icon(FontAwesomeIcons.mapSigns)),
                  buildTapItem(index: 2, icon: const Icon(Icons.folder))
                ])));
  }

  Widget buildTapItem({
    required int index,
    required Icon icon,
  }) {
    final isSelected = index == widget.index;

    return IconTheme(
      data: IconThemeData(
        color: isSelected ? Colors.white : Colors.white38,
      ),
      child: IconButton(
        iconSize: 35,
        icon: icon,
        onPressed: () {
          widget.onChangedTab(index);
          widget.buttonDissapearing(index);
        },
      ),
    );
  }
}
