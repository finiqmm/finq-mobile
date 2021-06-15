import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundedProfileIcon extends StatelessWidget {
  final String? imageUrl;

  RoundedProfileIcon({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: this.imageUrl ?? "",
      errorWidget: (content, url, error) => Container(
          color: Colors.white,
          child: Center(child: const Icon(FontAwesomeIcons.user))),
      placeholder: (content, url) => Container(
        color: Colors.white,
        child: Center(
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
