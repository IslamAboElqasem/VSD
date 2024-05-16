import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future signUp(String email, String password, BuildContext context) async {
    emit(SignUpLoading());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((val) {
      if (val.user != null) {
        val.user!.sendEmailVerification().then((_) {
          emit(SignUpSuccess());
        }).catchError((error) {
          emit(SignUpFailure(errorMessage: error));
        });
      }
    });
  }
}
