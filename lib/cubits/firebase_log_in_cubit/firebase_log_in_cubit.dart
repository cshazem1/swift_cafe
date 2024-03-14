import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_log_in_state.dart';

class FirebaseLogInCubit extends Cubit<FirebaseLogInState> {
  FirebaseLogInCubit() : super(FirebaseLogInInitial());

  Future<void> signIn({required String email, required String password}) async {
    emit(FirebaseLogInLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(FirebaseLogInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log("user-not-found");
        emit(FirebaseLogInFailure("No user found for that email."));
      } else if (e.code == 'wrong-password') {
        emit(FirebaseLogInFailure("Wrong password provided for that user."));
      } else {
        emit(FirebaseLogInFailure(e.toString()));

      }

    }

  }
}
