import 'package:flutter/material.dart';

showAlertDialog(
    {required BuildContext context, required String text, String? btnText}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            text,
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  btnText ?? 'OK',
                ))
          ],
        );
      });
}
