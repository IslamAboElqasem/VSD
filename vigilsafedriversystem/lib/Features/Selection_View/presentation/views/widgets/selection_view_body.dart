import 'package:flutter/material.dart';
import 'package:vigilsafedriversystem/Features/Selection_View/presentation/views/widgets/assert_car_plate.dart';
import 'package:vigilsafedriversystem/Features/Selection_View/presentation/views/widgets/custom_app_bar.dart';
import 'package:vigilsafedriversystem/Features/Selection_View/presentation/views/widgets/user_drawer.dart';
import 'package:vigilsafedriversystem/constant.dart';

class SelectionViewBody extends StatelessWidget {
  const SelectionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: userDrawer(context),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2196F3), Color.fromARGB(255, 33, 68, 243)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                'assets/back_ground.jpeg', // Background pattern image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
        ]),
      ),
    );
  }
}
