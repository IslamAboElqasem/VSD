import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vigilsafedriversystem/core/models/user_model/driver_info.dart';

part 'entre_tracker_state.dart';

class EntreTrackerCubit extends Cubit<EntreTrackerState> {
  EntreTrackerCubit() : super(EntreTrackerInitial());

  Future sendDriverDataToTracker(DriverInfo driverInfo) async {
    emit(EntreTrackerLoading());
    if (driverInfo.email == 'heshamislam556@gmail.com') {
      FirebaseFirestore.instance
          .collection('DataUsers')
          .doc('yAfsyh7xqiRhdCiluBN8d4eefh43')
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
      emit(EntreTrackerSuccess());
    } else if (driverInfo.email == 'islamhesham269@gmail.com') {
      FirebaseFirestore.instance
          .collection('DataUsers')
          .doc('ew1k3iE0bddrs8JiqAKzeZHY9YD3')
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
      emit(EntreTrackerSuccess());
    } else {
      emit(EntreTrackerFailure(errorMessage: 'this email not found '));
    }
  }
}
