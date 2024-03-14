
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_sign_up_state.dart';

class FirebaseSignUpCubit extends Cubit<FirebaseSignUpState>{
  String? ex;
  FirebaseSignUpCubit():super(FirebaseSignUpInitial());
  Future<void> register({required String email,required String password}) async {
    emit(FirebaseSignUpLoading());
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
      else  {emit(FirebaseSignUpFailure(e.code));}
    } catch (e) {
      ex=e.toString();
      emit(FirebaseSignUpFailure(e.toString()));
    }

  }

}