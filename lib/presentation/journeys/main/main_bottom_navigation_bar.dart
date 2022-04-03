import 'package:finq/presentation/journeys/main/main_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:finq/common/extension/string_extension.dart';

class MainBottomNavigationBar extends StatelessWidget {
  final Function(int) onSelectedIndexChange;
  final int selectedIndex;
  const MainBottomNavigationBar(
      {Key? key,
      required this.selectedIndex,
      required this.onSelectedIndexChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          onSelectedIndexChange(index);
        },
        items: navBarItems
            .map((e) => BottomNavigationBarItem(
                icon: Icon(e.iconData), label: e.title.t(context)))
            .toList());
  }
}
