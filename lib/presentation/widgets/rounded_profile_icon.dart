import 'package:cached_network_image/cached_network_image.dart';
import 'package:finq/common/constants/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:finq/common/extension/size_extension.dart';

class RoundedProfileIcon extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;

  RoundedProfileIcon({required this.imageUrl,required this.width,required this.height});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: this.imageUrl ?? "",
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
        );
      },
      errorWidget: (content, url, error) => Container(
          height: height,
          width: width,
          color: Colors.white,
          child: Center(child: const Icon(FontAwesomeIcons.user))),
      placeholder: (content, url) => Container(
        height: height,
        width: width,
        color: Colors.white,
        child: Center(child: const CircularProgressIndicator()),
      ),
    );
  }
}
