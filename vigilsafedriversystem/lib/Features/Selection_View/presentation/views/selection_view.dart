import 'package:flutter/material.dart';
import 'package:vigilsafedriversystem/Features/Selection_View/presentation/views/widgets/selection_view_body.dart';
import 'package:vigilsafedriversystem/core/models/user_model/user_detail.dart';

class SelectionView extends StatelessWidget {
  const SelectionView({super.key, required this.userDetails});
  final UserDetails? userDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectionViewBody(
          userDetails: UserDetails(
              email: userDetails!.email,
              firstName: userDetails!.firstName,
              lastName: userDetails!.lastName,
              nationalID: userDetails!.nationalID,
              phoneNumber: userDetails!.phoneNumber)),
    );
  }
}
