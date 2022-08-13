class UserModel {
  String? uid;
  String? email;
  String? name;
  String? phone;
  String? status;
  String? urlImg;

  UserModel(
      {this.uid, this.name, this.email, this.phone, this.status, this.urlImg});

  //data from server
  factory UserModel.fromMap(map) {
    return UserModel(
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
