import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticlCoverPhoto extends StatelessWidget {
  final String coverPhotoUrl;

  ArticlCoverPhoto({required this.coverPhotoUrl});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white.withOpacity(0.3), Colors.black])),
        child: CachedNetworkImage(
          placeholder: (context, url) {
            return Center(child: CircularProgressIndicator());
          },
          imageUrl: coverPhotoUrl,
          width: double.infinity,
          height: 180,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
