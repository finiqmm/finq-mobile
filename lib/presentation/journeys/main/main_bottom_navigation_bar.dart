import 'package:finq/presentation/journeys/main/main_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:finq/common/extension/string_extension.dart';

class MainBottomNavigationBar extends StatefulWidget {
  final Function(int) onSelectedIndexChange;
  const MainBottomNavigationBar({Key? key, required this.onSelectedIndexChange})
      : super(key: key);

  @override
  _MainBottomNavigationBarState createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          widget.onSelectedIndexChange(index);
          setState(() {
            _selectedIndex = index;
          });
        },
        items: navBarItems
            .map((e) => BottomNavigationBarItem(
                icon: Icon(e.iconData),
                label: e.title.t(context)))
            .toList());
  }
}
