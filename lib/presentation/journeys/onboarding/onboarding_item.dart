import 'package:finq/presentation/journeys/onboarding/onboarding.dart';
import 'package:flutter/material.dart';

class OnboaringItem extends StatelessWidget {
  final Onboarding onboarding;
  const OnboaringItem({Key? key, required this.onboarding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Image(
              image: AssetImage(
                onboarding.imagePath,
              ),
              height: 300.0,
              width: 300.0,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            onboarding.title,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
          ),
          SizedBox(height: 15.0),
          Text(onboarding.label,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}
