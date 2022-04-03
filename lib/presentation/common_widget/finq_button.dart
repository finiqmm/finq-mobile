import 'package:flutter/material.dart';
import 'package:finq/common/extension/size_extension.dart';
import 'package:finq/common/constants/size_constants.dart';

class FinQButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const FinQButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_12.w)),
          color: Theme.of(context).colorScheme.secondary
        ),
        padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
        margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h,horizontal: Sizes.dimen_4.w),
        height: Sizes.dimen_48,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .button!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
