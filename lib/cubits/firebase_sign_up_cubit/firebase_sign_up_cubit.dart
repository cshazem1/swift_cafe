
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_lsign_up_state.dart';

class FirebaseSignUpCubit extends Cubit<FirebaseSignUpState>{
  FirebaseSignUpCubit():super(FirebaseLSignUpInitial());
  Future<void> register({required String email,required String password}) async {
    emit(FirebaseLSignUpLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      emit(FirebaseSignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(FirebaseSignUpFailure("The password provided is too weak."));
      } else if (e.code == 'email-already-in-use') {
        emit(FirebaseSignUpFailure("email-already-in-use"));

      }
    } catch (e) {
      emit(FirebaseSignUpFailure(e.toString()));
    }


  }

}