import 'package:flutter/material.dart';
import 'package:vigilsafedriversystem/Features/Tracker/presentation/views/widgets/tracker_view_body.dart';

class TrackerView extends StatelessWidget {
  const TrackerView({super.key, required this.userUid});
  final String userUid;

  @override
  Widget build(BuildContext context) {
    return TrackerViewBody(userUid: userUid);
  }
}
