import 'package:flutter/material.dart';

class MainNavbar {
  final int index;
  final String title;
  final IconData iconData;

  const MainNavbar(
      {required this.index, required this.title, required this.iconData})
      : assert(index >= 0, 'index cannot be negative');
}

final navBarItems = [
  MainNavbar(index: 0, title: 'Home', iconData: Icons.home),
  MainNavbar(index: 0, title: 'Loan Calculator', iconData: Icons.calculate),
  MainNavbar(index: 0, title: 'Articles', iconData: Icons.article),
  MainNavbar(index: 0, title: 'Profile', iconData: Icons.person)
];
