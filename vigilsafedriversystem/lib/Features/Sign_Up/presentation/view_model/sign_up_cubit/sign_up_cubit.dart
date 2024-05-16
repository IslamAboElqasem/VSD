import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vigilsafedriversystem/Features/Sign_Up/presentation/view_model/user_model/user_info.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future signUp(UserDetails userDetails, BuildContext context) async {
    emit(SignUpLoading());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userDetails.email!.trim(),
            password: userDetails.password!.trim())
        .then((val) {
      if (val.user != null) {
        FirebaseFirestore.instance
            .collection('DataUsers')
            .doc(val.user!.uid)
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
