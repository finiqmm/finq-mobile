import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileBackdropWidget extends StatelessWidget {
  const ProfileBackdropWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 90 / 2),
          child: FractionallySizedBox(
            heightFactor: 1,
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 90,
            width: 90,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl:
                    'https://i.picsum.photos/id/989/536/354.jpg?hmac=VxcXpy_SClu7tyi7VoEqlxnyZqgNcMYdWO8gB28XxZQ',
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
       
      ],
    );
  }
}
