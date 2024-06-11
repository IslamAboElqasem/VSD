import 'package:flutter/material.dart';
import 'package:vigilsafedriversystem/Features/Tracker/presentation/views/widgets/tracker_view_body.dart';
import 'package:vigilsafedriversystem/core/models/user_model/user_detail.dart';

class TrackerView extends StatelessWidget {
  const TrackerView({super.key, required this.userDetails});
  final UserDetails userDetails;

  @override
  Widget build(BuildContext context) {
    return TrackerViewBody(
      userDetails: UserDetails(
          email: userDetails.email,
          firstName: userDetails.firstName,
          lastName: userDetails.lastName,
          nationalID: userDetails.nationalID,
          phoneNumber: userDetails.phoneNumber),
    );
  }
}
