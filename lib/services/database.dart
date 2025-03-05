import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUser(Map<String, dynamic> userInfoMap, String userId) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(userId)
        .set(userInfoMap);
  }
}
