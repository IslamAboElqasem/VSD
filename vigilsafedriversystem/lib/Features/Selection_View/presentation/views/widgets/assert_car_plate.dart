import 'package:flutter/material.dart';

void assertCarPlate(BuildContext context) {
  TextEditingController textFieldController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Enter Car Plate'),
        content: TextField(
          controller: textFieldController,
          decoration: const InputDecoration(hintText: "Enter your name"),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              // Handle the 'OK' button press here
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
