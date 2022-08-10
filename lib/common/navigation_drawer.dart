// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:rtmapp1/common/drawer_item.dart';
// import 'package:rtmapp1/models/user_model.dart';
// import 'package:rtmapp1/screens/capteurs_screen.dart';
// import 'package:rtmapp1/screens/listUser_screen.dart';
// import 'package:rtmapp1/screens/login_screen.dart';
// import 'package:rtmapp1/screens/profil_screen.dart';
// import 'package:rtmapp1/screens/register_screen.dart';
// import 'package:rtmapp1/screens/welcome_screen.dart';

// class NavigationDrawer extends StatefulWidget {
//   const NavigationDrawer({Key? key}) : super(key: key);

//   @override
//   State<NavigationDrawer> createState() => _NavigationDrawerState();
// }

// class _NavigationDrawerState extends State<NavigationDrawer> {
//   User? user = FirebaseAuth.instance.currentUser;
//   UserModel loggedInUser = UserModel();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     FirebaseFirestore.instance
//         .collection("users")
//         .doc(user!.uid)
//         .get()
//         .then((value) {
//       this.loggedInUser = UserModel.fromMap(value.data());
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Material(
//         color: Color.fromARGB(255, 3, 56, 100),
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
//           child: Column(
//             children: <Widget>[
//               ActionChip(
//                 label: headerWidget(),
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => ProfilScreen()));
//                 },
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               const Divider(
//                 thickness: 1,
//                 height: 10,
//                 color: Colors.white,
//               ),
//               const SizedBox(
//                 height: 30,
//               ),

//               DrawerItem(
//                   name: 'AJOUTER',
//                   icon: Icons.people,
//                   onPressed: () => onItemPressed(context, index: 0)),
//               DrawerItem(
//                   name: 'LISTE UTILISATEURS',
//                   icon: Icons.people,
//                   onPressed: () => onItemPressed(context, index: 1)),

//               DrawerItem(
//                   name: 'CAPTEURS',
//                   icon: Icons.people,
//                   onPressed: () => onItemPressed(context, index: 2)),
//               // DrawerItem(
//               //     name: 'CAPTEURS',
//               //     icon: Icons.people,
//               //     onPressed: () => onItemPressed(context, index: 3)),
//               const Divider(
//                 thickness: 1,
//                 height: 10,
//                 color: Colors.white,
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               DrawerItem(
//                 name: 'Logout',
//                 icon: Icons.people,
//                 onPressed: () {
//                   logout(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void onItemPressed(BuildContext context, {required int index}) {
//     Navigator.pop(context);

//     switch (index) {
//       case 0:
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => RegisterScreen()));
//         break;

//       case 1:
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => ListUserScreen()));
//         break;

//       case 2:
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => CapteursScreen()));
//         break;

//       // case 3:
//       //   Navigator.push(
//       //       context, MaterialPageRoute(builder: (context) => ProfilScreen()));
//       //   break;
//     }
//   }

//   Widget headerWidget() {
//     //image
//     return Row(children: [
//       const CircleAvatar(
//         radius: 40,
//         //backgroundColor: NetworkImage("url"),
//       ),
//       const SizedBox(
//         width: 20,
//       ),
//       Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             "${loggedInUser.name}",
//             style: TextStyle(fontSize: 15, color: Colors.black),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Text(
//             "${loggedInUser.email}",
//             style: TextStyle(fontSize: 15, color: Colors.black),
//           ),
//         ],
//       ),
//       // Column(
//       //   crossAxisAlignment: CrossAxisAlignment.start,
//       //   children: const [
//       //     Text(
//       //       'Person name',
//       //       style: TextStyle(fontSize: 14, color: Colors.white),
//       //     ),
//       //     SizedBox(
//       //       height: 10,
//       //     ),
//       //     Text(
//       //       'person@email.com',
//       //       style: TextStyle(fontSize: 14, color: Colors.white),
//       //     ),
//       //   ],
//       // )
//     ]);
//   }

//   Future<void> logout(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => WelcomeScreen()));
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:rtmapp1/common/drawer_item.dart';
import 'package:rtmapp1/screens/capteurs_screen.dart';
import 'package:rtmapp1/screens/home_screen.dart';

import 'package:rtmapp1/screens/login_screen.dart';
import 'package:rtmapp1/screens/profil_screen.dart';
import 'package:rtmapp1/screens/user_list.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color.fromARGB(255, 5, 5, 109),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(
                height: 40,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 40,
              ),
              DrawerItem(
                name: 'Utilisateurs',
                icon: Icons.people,
                onPressed: () => onItemPressed(context, index: 0),
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Mon Compte',
                  icon: Icons.account_box_rounded,
                  onPressed: () => onItemPressed(context, index: 1)),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Historique',
                  icon: Icons.message_outlined,
                  onPressed: () => onItemPressed(context, index: 2)),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Système',
                  icon: Icons.favorite_outline,
                  onPressed: () => onItemPressed(context, index: 3)),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Paramètre',
                  icon: Icons.settings,
                  onPressed: () => onItemPressed(context, index: 4)),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                name: 'Deconnexion',
                icon: Icons.logout,
                onPressed: () {
                  logout(context);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => LoginScreen()));
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
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => UserslistScreen()));
        break;

      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfilScreen()));
        break;

      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
        break;

      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CapteursScreen()));
        break;

      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SettingScreen()));
        break;
    }
  }

  Widget headerWidget() {
    const url =
        'https://media.istockphoto.com/photos/learn-to-love-yourself-first-picture-id1291208214?b=1&k=20&m=1291208214&s=170667a&w=0&h=sAq9SonSuefj3d4WKy4KzJvUiLERXge9VgZO-oqKUOo=';
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(url),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Person name',
                style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(
              height: 10,
            ),
            Text('person@email.com',
                style: TextStyle(fontSize: 14, color: Colors.white))
          ],
        )
      ],
    );
  }

  SettingScreen() {}

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
