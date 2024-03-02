class FirebaseSignUpState {}
class FirebaseLSignUpInitial extends FirebaseSignUpState {}

class FirebaseLSignUpLoading extends FirebaseSignUpState {}

class FirebaseSignUpSuccess extends FirebaseSignUpState {}

class FirebaseSignUpFailure extends FirebaseSignUpState {
  String message;

  FirebaseSignUpFailure(this.message);
}