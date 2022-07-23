import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService(this.uid);

  final CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection("users");

  Future<void> saveUser(String name, String phone, String status) async {
    return await userCollection
        .doc(uid)
        .set({'name': name, 'phone': phone, 'status': status});
  }

  AppUserData _userFromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception("user not found");
    return AppUserData(
      uid: uid,
      name: data['name'],
      phone: data['phone'],
      status: data['status'],
    );
  }

  // Stream<AppUserData> get user {
  //   return userCollection.doc(uid).snapshots().map(_userFromSnapshot);
  // }

  List<AppUserData> _userListFromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      return _userFromSnapshot(doc);
    }).toList();
  }

  // Stream<List<AppUserData>> get users {
  //   return userCollection.snapshots().map(_userListFromSnapshot);
  // }
}
