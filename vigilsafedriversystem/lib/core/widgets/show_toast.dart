import 'package:flutter/material.dart';

void showToast(BuildContext context, String txt, Color color) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(
        txt,
        style: const TextStyle(fontSize: 18),
      ),
      //action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
