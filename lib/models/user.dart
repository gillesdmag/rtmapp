import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String uid;

  AppUser(this.uid);
}

class AppUserData {
  String? uid;
  String? email;
  String? name;
  String? phone;
  String? status;
  String? urlImg;

  AppUserData(
      {this.uid, this.name, this.email, this.phone, this.status, this.urlImg});

  //data from server
  factory AppUserData.fromMap(map) {
    return AppUserData(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      status: map['status'],
      urlImg: map['urlImg'],
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
      'urlImg': urlImg,
    };
  }
}


// Future<void> _update() async {
//     // FirebaseFirestore.instance
//     //     .collection("Users")
//     //     .doc(user!.uid)
//     //     .get()
//     //     .then((value) {
//     //   this.loggedInUser = AppUserData.fromMap(value.data());
//     //   final DocumentSnapshot documentSnapshot =
//     //       loggedInUser as DocumentSnapshot<Object?>;
//     //   setState(() {});
//     // });
//     // if (documentSnapshot != null) {
//     //   _nameController.text = documentSnapshot['name'];
//     //   _emailController.text = documentSnapshot['email'];
//     //   _phoneController.text = documentSnapshot['phone'];
//     //   _statusController.text = documentSnapshot['status'];
//     // }

//     await showModalBottomSheet(
//         isScrollControlled: true,
//         context: context,
//         builder: (BuildContext ctx) {
//           return Padding(
//             padding: EdgeInsets.only(
//                 top: 20,
//                 left: 20,
//                 right: 20,
//                 bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextField(
//                   controller: _nameController,
//                   decoration: const InputDecoration(labelText: 'Name'),
//                 ),
//                 TextField(
//                   // keyboardType:
//                   //     const TextInputType.numberWithOptions(decimal: false),
//                   controller: _emailController,
//                   decoration: const InputDecoration(
//                     labelText: 'email',
//                   ),
//                 ),
//                 TextField(
//                   controller: _phoneController,
//                   decoration: const InputDecoration(labelText: 'phone'),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ElevatedButton(
//                   child: const Text('Update'),
//                   onPressed: () async {
//                     final String name = _nameController.text;
//                     final String? email = _emailController.text;
//                     final String phone = _phoneController.text;

//                     if (email != null) {
//                       RegExp regex = new RegExp(r'^.{6,}$');

//                       await _users.doc(loggedInUser.uid).update({
//                         "name": name,
//                         "email": email,
//                         "phone": phone,
//                       });
//                       _nameController.text = '';
//                       _emailController.text = '';
//                       _phoneController.text = '';

//                       Navigator.of(context).pop();
//                     }
//                   },
//                 )
//               ],
//             ),
//           );
//         });
//   }

// _nameController.text = loggedInUser.name!;
//     _emailController.text = loggedInUser.email!;
//     _phoneController.text = loggedInUser.phone!;