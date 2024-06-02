import 'package:flutter/material.dart';
import 'package:vigilsafedriversystem/Features/Driver/presentation/views/widgets/driver_view_body.dart';

void assertCarPlate(BuildContext context) {
  TextEditingController textFieldController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Enter Car Plate'),
        content: TextField(
          controller: textFieldController,
          decoration: const InputDecoration(hintText: "ABC | 1235"),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DriverViewBody(),
                  ));
            },
          ),
        ],
      );
    },
  );
}
