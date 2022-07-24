import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rtmapp1/common/drawer_item.dart';
import 'package:rtmapp1/models/user_model.dart';
import 'package:rtmapp1/screens/capteurs_screen.dart';
import 'package:rtmapp1/screens/listUser_screen.dart';
import 'package:rtmapp1/screens/login_screen.dart';
import 'package:rtmapp1/screens/profil_screen.dart';
import 'package:rtmapp1/screens/register_screen.dart';
import 'package:rtmapp1/screens/welcome_screen.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color.fromARGB(255, 3, 56, 100),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            children: <Widget>[
              ActionChip(
                label: headerWidget(),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilScreen()));
                },
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.white,
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'AJOUTER',
                  icon: Icons.people,
                  onPressed: () => onItemPressed(context, index: 0)),
              DrawerItem(
                  name: 'LISTE UTILISATEURS',
                  icon: Icons.people,
                  onPressed: () => onItemPressed(context, index: 1)),
              DrawerItem(
                  name: 'CAPTEURS',
                  icon: Icons.people,
                  onPressed: () => onItemPressed(context, index: 2)),
              // DrawerItem(
              //     name: 'CAPTEURS',
              //     icon: Icons.people,
              //     onPressed: () => onItemPressed(context, index: 3)),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.white,
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                name: 'Logout',
                icon: Icons.people,
                onPressed: () {
                  logout(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegisterScreen()));
        break;

      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ListUserScreen()));
        break;

      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CapteursScreen()));
        break;

      // case 3:
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => ProfilScreen()));
      //   break;
    }
  }

  Widget headerWidget() {
    //image
    return Row(children: [
      const CircleAvatar(
        radius: 40,
        //backgroundColor: NetworkImage("url"),
      ),
      const SizedBox(
        width: 20,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "${loggedInUser.name}",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "${loggedInUser.email}",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ],
      ),
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: const [
      //     Text(
      //       'Person name',
      //       style: TextStyle(fontSize: 14, color: Colors.white),
      //     ),
      //     SizedBox(
      //       height: 10,
      //     ),
      //     Text(
      //       'person@email.com',
      //       style: TextStyle(fontSize: 14, color: Colors.white),
      //     ),
      //   ],
      // )
    ]);
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }
}
