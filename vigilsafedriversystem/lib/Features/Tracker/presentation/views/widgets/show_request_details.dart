import 'package:flutter/material.dart';
import 'package:vigilsafedriversystem/core/models/user_model/driver_info.dart';

void ShowRequestDetails(BuildContext context, DriverInfo driverInfo) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Request Details'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(driverInfo.firstname.toString() +
                driverInfo.lastname.toString()),
            Text(driverInfo!.driverPhone.toString()),
            Text(
                'Car Plate: ${driverInfo.carPlate.toString()}\nLatitude: ${driverInfo.latitude.toString()}\nLongitude: ${driverInfo.longitude.toString()}'),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
