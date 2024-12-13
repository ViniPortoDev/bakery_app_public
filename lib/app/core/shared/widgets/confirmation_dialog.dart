import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

Future<void> confirmationDialog(context,
    {required String title,
    required String content,
    required Function confirmationFunction}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: AlertDialog(
          title: Text(
            '$title',
            style: TextStyle(color: AppColors.gradient02),
          ),
          content: Text('$content'),
          actions: [
            TextButton(
                onPressed: () => {Navigator.pop(context)},
                child: Text(
                  'Não',
                  style: TextStyle(fontSize: 15, color: AppColors.bege),
                )),
            TextButton(
                onPressed: () => {
                      confirmationFunction(),
                      Navigator.pop(context),
                    },
                child: Text(
                  'Sim',
                  style: TextStyle(fontSize: 15, color: AppColors.gradient01),
                )),
          ],
          elevation: 20,
        ),
      );
    },
  );
}
