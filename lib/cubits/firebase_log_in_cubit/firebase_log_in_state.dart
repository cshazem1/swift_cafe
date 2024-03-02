class FirebaseLogInState {}
class FirebaseLogInInitial extends FirebaseLogInState {}

class FirebaseLogInLoading extends FirebaseLogInState {}

class FirebaseLogInSuccess extends FirebaseLogInState {}

class FirebaseLogInFailure extends FirebaseLogInState {
  String message;

  FirebaseLogInFailure(this.message);
}