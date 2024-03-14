class FirebaseSignUpState {}
class FirebaseSignUpInitial extends FirebaseSignUpState {}

class FirebaseSignUpLoading extends FirebaseSignUpState {}

class FirebaseSignUpSuccess extends FirebaseSignUpState {}

class FirebaseSignUpFailure extends FirebaseSignUpState {
  String message;

  FirebaseSignUpFailure(this.message);
}