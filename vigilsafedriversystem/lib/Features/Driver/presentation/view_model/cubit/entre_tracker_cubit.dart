import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vigilsafedriversystem/core/models/user_model/driver_info.dart';

part 'entre_tracker_state.dart';

class EntreTrackerCubit extends Cubit<EntreTrackerState> {
  EntreTrackerCubit() : super(EntreTrackerInitial());

  Future sendDriverDataToTracker(
      String trackerEmail, DriverInfo driverInfo) async {
    emit(EntreTrackerLoading());
    try {
      FirebaseFirestore.instance
          .collection('DataUsers')
          .doc(trackerEmail.trim())
          .collection('Requests')
          .doc()
          .set({
        'first_name': driverInfo.firstname,
        'last_name': driverInfo.lastname,
        'email': driverInfo.email,
        'phone': driverInfo.driverPhone,
        'longitude': driverInfo.longitude,
        'latitude': driverInfo.latitude,
        'car_plate': driverInfo.carPlate
      });
      emit(EntreTrackerLoading());
    } on Exception catch (e) {
      emit(EntreTrackerFailure(errorMessage: e.toString()));
    }
  }
}
