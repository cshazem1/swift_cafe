import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swift_cafe/models/user_model.dart';

class Users {
  static CollectionReference users = FirebaseFirestore.instance
      .collection('users');

  static Future<void> addUser(
      {required String name, required String email}) async {
    // Call the user's CollectionReference to add a new user
    return await users.add({
      'name': name, // John Doe
      'email': email
      // 42
    }).then((DocumentReference docRef) {
      docRef.update({"id": docRef.id});
    // ignore: invalid_return_type_for_catch_error, avoid_print
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Future<UserModel> searchUsersAndEmail(String email) async {
    try {
      // Step 1: Query Firestore for Users
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      // Step 2: Retrieve User Emails
      UserModel? userModel;
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        userModel = UserModel(
            name: doc.get('name'), email: doc.get('email'), id: doc.get('id'));
      }

      return userModel!;
    } catch (e) {
      return UserModel(
          name: "",
          email: "",
          id: ""); // Return an empty list if there's an error
    }
  }
}
