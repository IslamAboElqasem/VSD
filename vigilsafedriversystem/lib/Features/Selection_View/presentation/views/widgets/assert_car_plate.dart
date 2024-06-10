import 'package:flutter/material.dart';
import 'package:vigilsafedriversystem/Features/Driver/presentation/views/driver_view.dart';
import 'package:vigilsafedriversystem/core/models/user_model/user_detail.dart';
import 'package:vigilsafedriversystem/core/widgets/show_toast.dart';

void assertCarPlate(BuildContext context, UserDetails userDetails) {
  final TextEditingController carPlateControler = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Enter Car Plate'),
        content: TextField(
          controller: carPlateControler,
          decoration: const InputDecoration(hintText: "ABC | 1235"),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              if (carPlateControler.text.isEmpty) {
                showToast(context, 'Car plate cannot be empty', Colors.red);
              } else {
                // Navigate to DriverViewBody if input is valid
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DriverView(
                      carPlate: carPlateControler.text,
                      userDetails: UserDetails(
                          email: userDetails.email,
                          firstName: userDetails.firstName,
                          lastName: userDetails.lastName,
                          nationalID: userDetails.nationalID,
                          phoneNumber: userDetails.phoneNumber),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      );
    },
  );
}
