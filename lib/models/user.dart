class AppUser {
  final String uid;

  AppUser(this.uid);
}

class AppUserData {
  final String? uid;
  final String? name;
  final String? phone;
  final String? status;

  AppUserData({this.uid, this.name, this.phone, this.status});
}
