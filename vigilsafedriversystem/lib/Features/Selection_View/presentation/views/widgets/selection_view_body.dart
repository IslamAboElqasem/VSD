import 'package:flutter/material.dart';
import 'package:vigilsafedriversystem/Features/Selection_View/presentation/views/widgets/assert_car_plate.dart';
import 'package:vigilsafedriversystem/Features/Selection_View/presentation/views/widgets/custom_app_bar.dart';
import 'package:vigilsafedriversystem/Features/Selection_View/presentation/views/widgets/user_drawer.dart';

class SelectionViewBody extends StatelessWidget {
  const SelectionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: userDrawer(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            const SizedBox(
              height: 200,
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
            const SizedBox(height: 5),
            const Text(
              '                               Or',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
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
          ],
        ),
      ),
    );
  }
}
