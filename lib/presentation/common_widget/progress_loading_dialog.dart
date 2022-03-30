import 'package:flutter/material.dart';

class ProgressLoadingDialog extends StatelessWidget {
  final String loadingMsg;

  const ProgressLoadingDialog({Key? key, required this.loadingMsg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7), child: Text(loadingMsg)),
        ],
      ),
    );
  }
}
