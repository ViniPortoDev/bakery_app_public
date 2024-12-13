import 'package:flutter/material.dart';

Future<void> customDialog(context,
    {required icon,
    required content,
    required actionButtons,
    required bool canTapOutside}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: canTapOutside,
    builder: (BuildContext context) {
      return Container(
        width: 400,
        height: 500,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          title: icon,
          content: content,
          actions: actionButtons,
          elevation: 20,
        ),
      );
    },
  );
}