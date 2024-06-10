import 'package:flutter/material.dart';
import 'package:vigilsafedriversystem/Features/Selection_View/presentation/views/widgets/assert_car_plate.dart';
import 'package:vigilsafedriversystem/Features/Selection_View/presentation/views/widgets/custom_app_bar.dart';
import 'package:vigilsafedriversystem/Features/Selection_View/presentation/views/widgets/user_drawer.dart';
import 'package:vigilsafedriversystem/Features/Tracker/presentation/views/tracker_view.dart';
import 'package:vigilsafedriversystem/constant.dart';
import 'package:vigilsafedriversystem/core/models/user_model/user_detail.dart';

class SelectionViewBody extends StatelessWidget {
  const SelectionViewBody(
      {super.key, required this.userDetails, required this.userUid});
  final UserDetails? userDetails;
  final String? userUid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: userDrawer(
          context,
          userDetails!.firstName.toString(),
          userDetails!.lastName.toString(),
          userDetails!.phoneNumber.toString()),
      body: Stack(children: [
        Image.asset(
          'assets/back_ground.jpeg', // Background pattern image
          opacity: const AlwaysStoppedAnimation(.2),
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CustomSelectionAppBar(),
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TrackerView(userUid: userUid!),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.blue,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    child: const Text(
                      'Tracker',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      assertCarPlate(
                          context,
                          UserDetails(
                              email: userDetails!.email,
                              firstName: userDetails!.firstName,
                              lastName: userDetails!.lastName,
                              nationalID: userDetails!.nationalID,
                              phoneNumber: userDetails!.phoneNumber));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.blue,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    child: const Text(
                      'Driver',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Image.asset(
                  logo,
                  height: 300,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
