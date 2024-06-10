import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vigilsafedriversystem/core/models/user_model/user_detail.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  Map userDetails = {};
  String? userUid;

  Future loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    emit(SignInLoading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.trim(), password: password)
          .then((value) async {
        userUid = value.user!.uid;
        await FirebaseFirestore.instance
            .collection('DataUsers')
            .doc(value.user!.uid)
            .get()
            .then((doc) {
          userDetails.addAll({
            'email': doc.data()!['email'],
            'firstName': doc.data()!['first_name'],
            'lastName': doc.data()!['last_name'],
            'phoneNumber': doc.data()!['phone'],
            'nationalID': doc.data()!['national_ID']
          });
        });
      });
      emit(SignInSuccess(
          userUid: userUid!,
          userDetails: UserDetails(
              email: userDetails.values.toList()[0],
              firstName: userDetails.values.toList()[1],
              lastName: userDetails.values.toList()[2],
              nationalID: userDetails.values.toList()[4],
              phoneNumber: userDetails.values.toList()[3])));
    } on Exception catch (e) {
      emit(SignInFailure(errorMessage: e.toString()));
    }
  }
}
