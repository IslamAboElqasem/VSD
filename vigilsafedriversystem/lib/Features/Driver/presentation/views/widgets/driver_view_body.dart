import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class DriverViewBody extends StatefulWidget {
  const DriverViewBody({super.key});

  @override
  State<DriverViewBody> createState() => _DriverViewBodyState();
}

class _DriverViewBodyState extends State<DriverViewBody> {
  Position? _position;
  TextEditingController trackerEmail = TextEditingController();
  void getCurrentLocation() async {
    Position position = await determinePosition();

    setState(() {
      _position = position;
    });
  }

  Future<Position> determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 50,
              child: const Text(
                'Entre your Tracker ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              controller: trackerEmail,
            ),
            const SizedBox(
              height: 15,
            ),
            _position != null
                ? Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: Text(
                        'Current location:\nlatitude: ${_position!.latitude.toString()}\nlongitude: ${_position!.longitude.toString()}  '),
                  )
                : Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: const Text(
                      'tap to get your location',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  getCurrentLocation();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.blue,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                child: const Text(
                  'Get My Location',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
