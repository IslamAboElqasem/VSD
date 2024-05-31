import 'package:flutter/material.dart';

class TrackerOrDriverView extends StatelessWidget {
  const TrackerOrDriverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 260,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                child: const Text('Tracker'),
              ),
            ),
            const SizedBox(height: 5),
            const Text('or',
                style: TextStyle(
                    fontFamily: 'pacifico',
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            SizedBox(
              width: 260,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.blue,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
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
