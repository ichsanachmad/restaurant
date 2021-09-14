import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

customDialog(BuildContext context) {
  if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('Maintenance'),
          content: Text('This feature is under maintenance!'),
          actions: [
            CupertinoDialogAction(
              child: Text('Dismiss'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
