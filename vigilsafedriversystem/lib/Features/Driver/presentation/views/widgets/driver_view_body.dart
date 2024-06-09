import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
class DriverViewBody extends StatefulWidget {
  const DriverViewBody({super.key});

  @override
  State<DriverViewBody> createState() => _DriverViewBodyState();
}

class _DriverViewBodyState extends State<DriverViewBody> {
  Position? _position;

  void _getCurrentLocation() async {
    Position position = await _determinePosition();
    setState(() {
      _position = position;
    });
  }

  Future<Position> _determinePosition() async {
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
      body: Center(
        child: ,
          // child: _position != null
          //     ? Text(
          //         'Current location: \n latitude: ${_position!.latitude.toString()} \n longitude: ${_position!.longitude.toString()}  ')
          //     : const Text('tap to get your location')
           ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getCurrentLocation();
        },
        tooltip: 'get my location',
        child: const Icon(Icons.location_city),
      ),
    );
  }
}
