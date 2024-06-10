import 'package:flutter/material.dart';
import 'package:vigilsafedriversystem/Features/Driver/presentation/views/widgets/driver_view_body.dart';
import 'package:vigilsafedriversystem/core/models/user_model/user_detail.dart';

class DriverView extends StatelessWidget {
  const DriverView(
      {super.key, required this.userDetails, required this.carPlate});
  final UserDetails? userDetails;
  final String carPlate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DriverViewBody(
        userDetails: UserDetails(
            email: userDetails!.email,
            firstName: userDetails!.firstName,
            lastName: userDetails!.lastName,
            nationalID: userDetails!.nationalID,
            phoneNumber: userDetails!.phoneNumber),
        carPlate: carPlate,
      ),
    );
  }
}
