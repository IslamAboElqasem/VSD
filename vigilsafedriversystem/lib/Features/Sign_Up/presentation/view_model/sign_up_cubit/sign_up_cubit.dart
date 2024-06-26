import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vigilsafedriversystem/core/models/user_model/user_detail.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future registration(
      UserDetails userDetails, String password, BuildContext context) async {
    emit(SignUpLoading());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userDetails.email!.trim(), password: password)
        .then((val) {
      if (val.user != null) {
        FirebaseFirestore.instance
            .collection('DataUsers')
            .doc(userDetails.email)
            .set({
          'first_name': userDetails.firstName,
          'last_name': userDetails.lastName,
          'email': userDetails.email,
          'phone': userDetails.phoneNumber,
          'national_ID': userDetails.nationalID
        });
        val.user!.sendEmailVerification().then((_) {
          emit(SignUpSuccess());
        }).catchError((error) {
          emit(SignUpFailure(errorMessage: error));
        });
      }
    });
  }
}
