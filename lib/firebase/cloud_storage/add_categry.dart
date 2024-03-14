// ignore_for_file: invalid_return_type_for_catch_error

import 'package:cloud_firestore/cloud_firestore.dart';

class Categry {
 static Future<void> addCategry({required String name,required String desc,required String image,required String salary}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('categry');

   // Call the user's CollectionReference to add a new user
    return users.add({
      'name': name, // John Doe
      'desc': desc, // Stokes and Sons
      'rate': '0',
      'image': image,
      'salary': salary
      // 42
    }).then((DocumentReference docRef) {
      docRef.update({"id": docRef.id});
    // ignore: avoid_print
    }).catchError((error) => print("Failed to add user: $error"));
  }
}