// ignore_for_file: invalid_return_type_for_catch_error, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  static Future<void> addOrder(
      {required String name,
      required String image,
      required String salary,
      required String filling,
      required String milk,
      required String sugar,
      required String number,
      required String id,required String data}) async {
    CollectionReference order = FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .collection("order");

    // Call the user's CollectionReference to add a new user
    return order.add({
      'name': name, // John Doe
      'fill': filling, // Stokes and Sons
      'rate': '0',
      'image': image,
      'salary': salary,
      'milk': milk,
      'sugar': sugar,
      'number': number,
      'data':data
      // 42
    }).then((DocumentReference docRef) {
      docRef.update({"id": docRef.id});
    }).catchError((error) => print("Failed to add user: $error"));
  }
}
