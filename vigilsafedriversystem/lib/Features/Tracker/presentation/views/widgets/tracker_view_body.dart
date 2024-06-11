import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vigilsafedriversystem/Features/Driver/presentation/views/widgets/custom_driver_app_bar.dart';
import 'package:vigilsafedriversystem/core/models/user_model/driver_info.dart';
import 'package:vigilsafedriversystem/core/models/user_model/user_detail.dart';

import 'show_request_details.dart';

class TrackerViewBody extends StatefulWidget {
  const TrackerViewBody({super.key, required this.userDetails});

  final UserDetails userDetails;

  @override
  State<TrackerViewBody> createState() => _TrackerViewBodyState();
}

class _TrackerViewBodyState extends State<TrackerViewBody> {
  DriverInfo? _driverInfo;

  void getDriverInfo() async {
    FirebaseFirestore.instance
        .collection('DataUsers')
        .doc(widget.userDetails.email)
        .collection('Requests')
        .get()
        .then((value) {
      setState(() {
        _driverInfo = DriverInfo(
          firstname: value.docs.last['first_name'],
          lastname: value.docs.last['last_name'],
          driverPhone: value.docs.last['phone'],
          carPlate: value.docs.last['car_plate'],
          latitude: value.docs.last['latitude'],
          longitude: value.docs.last['longitude'],
          email: value.docs.last['email'],
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/trackerbackground.jpeg', // Background pattern image
            opacity: const AlwaysStoppedAnimation(.2),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomDriverAppBar(),
                  _driverInfo != null
                      ? Card(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                            title: Text(_driverInfo!.firstname.toString() +
                                _driverInfo!.lastname.toString()),
                            subtitle: Text(_driverInfo!.driverPhone.toString()),
                            onTap: () {
                              showRequestDetails(
                                  context,
                                  DriverInfo(
                                      firstname: _driverInfo!.firstname,
                                      lastname: _driverInfo!.lastname,
                                      driverPhone: _driverInfo!.driverPhone,
                                      carPlate: _driverInfo!.carPlate,
                                      latitude: _driverInfo!.latitude,
                                      longitude: _driverInfo!.longitude,
                                      email: _driverInfo!.email));
                            },
                          ),
                        )
                      : const Center(
                          child: Text(
                            'There is no Request yet',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                ],
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getDriverInfo();
        },
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
