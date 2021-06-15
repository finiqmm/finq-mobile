import 'package:finq/presentation/journeys/profile/profile_backdrop_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 0.35,
              child: ProfileBackdropWidget()),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.65,
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
