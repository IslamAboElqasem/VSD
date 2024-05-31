import 'package:flutter/material.dart';
import 'package:vigilsafedriversystem/constant.dart';

class TrackerOrDriverView extends StatelessWidget {
  const TrackerOrDriverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                logo,
                height: 80,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.account_circle_rounded,
                  color: Colors.black,
                  size: 30,
                ),
              )
            ],
          ),
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
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              child: const Text('Tracker'),
            ),
          ),
          const SizedBox(height: 5),
          const Text('                    or',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'pacifico',
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                _showAlertDialog(context);
              },
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
    ));
  }
}

void _showAlertDialog(BuildContext context) {
  TextEditingController textFieldController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Enter Car Plate'),
        content: TextField(
          controller: textFieldController,
          decoration: const InputDecoration(hintText: "Enter your name"),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {},
          ),
        ],
      );
    },
  );
}
