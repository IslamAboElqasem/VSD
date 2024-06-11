import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vigilsafedriversystem/Features/Driver/presentation/view_model/cubit/entre_tracker_cubit.dart';
import 'package:vigilsafedriversystem/Features/Driver/presentation/views/widgets/custom_driver_app_bar.dart';
import 'package:vigilsafedriversystem/core/models/user_model/driver_info.dart';
import 'package:vigilsafedriversystem/core/models/user_model/user_detail.dart';
import 'package:vigilsafedriversystem/core/widgets/custom_loading_indicator.dart';
import 'package:vigilsafedriversystem/core/widgets/show_toast.dart';

class DriverViewBody extends StatefulWidget {
  const DriverViewBody(
      {super.key, required this.userDetails, required this.carPlate});
  final UserDetails? userDetails;
  final String carPlate;

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
    return BlocListener<EntreTrackerCubit, EntreTrackerState>(
      listener: (context, state) {
        if (state is EntreTrackerLoading) {
          const CustomLoadingIndicator();
        } else if (state is EntreTrackerSuccess) {
          showToast(
              context, 'Your Location is sent to Your Tracker', Colors.green);
        } else if (state is EntreTrackerFailure) {
          showToast(context, state.errorMessage, Colors.red);
        }
      },
      child: Scaffold(
        body: Stack(children: [
          Image.asset(
            'assets/driverBackGround.jpeg', // Background pattern image
            opacity: const AlwaysStoppedAnimation(.3),
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
                  const CustomDriverAppBar(),
                  const SizedBox(height: 50),
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
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
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
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    child: const Text(
                      'Entre your Tracker ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<EntreTrackerCubit>(context)
                            .sendDriverDataToTracker(
                                trackerEmail.text,
                                DriverInfo(
                                    firstname: widget.userDetails!.firstName,
                                    lastname: widget.userDetails!.lastName,
                                    driverPhone:
                                        widget.userDetails!.phoneNumber,
                                    carPlate: widget.carPlate,
                                    latitude: _position?.latitude.toString(),
                                    longitude: _position?.longitude.toString(),
                                    email: widget.userDetails!.email));
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.blue,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      child: const Text(
                        'Sent to My Tracker',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
