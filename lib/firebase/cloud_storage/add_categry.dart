import 'package:cloud_firestore/cloud_firestore.dart';

class AddCategry {
 static CollectionReference users = FirebaseFirestore.instance.collection('categry');
 static Future<void> addCategry({required String name,required String desc,required String image,required String salary}) async {
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
    }).catchError((error) => print("Failed to add user: $error"));
  }
}