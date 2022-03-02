import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomAppBarTab extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;

  BottomAppBarTab(
      // this.isMenuShown,
      {
    Key? key,
    required this.index,
    required this.onChangedTab,
  }) : super(key: key);

  @override
  _BottomAppBarTabState createState() => _BottomAppBarTabState();

  // var isMenuShown;

  var selectedIndex;
  // void buttonDissapearing(index) {
  //   if (index != 1) {
  //     isMenuShown = false;
  //   } else {
  //     isMenuShown = true;
  //   }
  // }
}

class _BottomAppBarTabState extends State<BottomAppBarTab> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        //   shape: CircularNotchedRectangle(),
        color: const Color.fromARGB(255, 155, 108, 77),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              buildTapItem(index: 0, icon: const Icon(Icons.person)),
              buildTapItem(
                  index: 1, icon: const Icon(FontAwesomeIcons.mapSigns)),
              buildTapItem(index: 2, icon: const Icon(Icons.folder))
            ]));
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
        },
      ),
    );
  }
}
