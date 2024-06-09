import 'package:flutter/material.dart';
import 'package:vigilsafedriversystem/Features/Selection_View/presentation/views/widgets/assert_car_plate.dart';
import 'package:vigilsafedriversystem/Features/Selection_View/presentation/views/widgets/custom_app_bar.dart';
import 'package:vigilsafedriversystem/Features/Selection_View/presentation/views/widgets/user_drawer.dart';
import 'package:vigilsafedriversystem/constant.dart';
import 'package:vigilsafedriversystem/core/models/user_model/user_detail.dart';

class SelectionViewBody extends StatelessWidget {
  const SelectionViewBody({super.key, required this.userDetails});
  final UserDetails? userDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: userDrawer(
          context,
          userDetails!.firstName.toString(),
          userDetails!.lastName.toString(),
          userDetails!.phoneNumber.toString()),
      body: Stack(children: [
        SizedBox(
          height: double.infinity,
          child: Positioned.fill(
            child: Image.asset(
              'assets/back_ground.jpeg', // Background pattern image
              opacity: const AlwaysStoppedAnimation(.2),
              fit: BoxFit.cover,
            ),
          ),
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
                const CustomAppBar(),
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.blue,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    child: const Text('Tracker'),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      assertCarPlate(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.blue,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    child: const Text('Driver'),
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
