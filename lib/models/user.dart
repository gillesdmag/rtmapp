import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String uid;

  AppUser(this.uid);
}

// class AppUserData {
//   final String? uid;
//   final String? name;
//   final String? phone;
//   final String? status;

//   AppUserData({this.uid, this.name, this.phone, this.status});
// }

class AppUserData {
  final String? uid;
  final String? name;
  final String? email;
  final String? phone;
  final String? status;
  final String? imagePath;
  final bool? isDarkMode;

  AppUserData(
      {this.uid,
      this.name,
      this.email,
      this.phone,
      this.status,
      this.imagePath,
      this.isDarkMode,
      required String about});

  // send data to server
  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'email': email,
        'phone': phone,
        'status': status,
      };

  // ignore: non_constant_identifier_names
  AppUserData.fromSnapshot(Snapshot, this.imagePath, this.isDarkMode)
      : uid = Snapshot.data()['uid'],
        name = Snapshot.data()['name'],
        email = Snapshot.data()['email'],
        phone = Snapshot.data()['phone'],
        status = Snapshot.data()['status'].toString();

  factory AppUserData.fromMap(map) {
    return AppUserData(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      status: map['status'],
      imagePath: map['imagePath'],
      about: '',
    );
  }

  // send data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'status': status,
    };
  }
}
