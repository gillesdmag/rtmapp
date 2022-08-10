import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rtmapp1/models/menu_item.dart';
import 'package:rtmapp1/screens/home_screen.dart';

import 'package:rtmapp1/screens/login_screen.dart';
import 'package:rtmapp1/screens/profil_screen.dart';
import 'package:rtmapp1/screens/register_screen.dart';
import 'package:rtmapp1/screens/user_list.dart';

class ControleScreen extends StatefulWidget {
  const ControleScreen({Key? key}) : super(key: key);

  @override
  _ControleScreenState createState() => _ControleScreenState();
}

class _ControleScreenState extends State<ControleScreen> {
  int selectedIndex = 0;

  //list of widgets to call ontap
  final widgetOptions = [
    new HomeScreen(),
    new RegisterScreen(),
    new UserslistScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final widgetTitle = [
    "Historique",
    "Ajouter Utilisateur",
    "Liste Utilisateur"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 13, 0, 130),
        title: Text(widgetTitle.elementAt(selectedIndex)),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 20, 9, 142),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.history_edu,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              label: "Historique"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_add_alt,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              label: "Ajouer"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list_alt,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              label: "Utilisateurs"),
        ],
        currentIndex: selectedIndex,
        fixedColor: Color.fromARGB(255, 255, 255, 255),
        onTap: onItemTapped,
        selectedLabelStyle:
            TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 15),
        unselectedFontSize: 12,
        selectedIconTheme:
            IconThemeData(color: Color.fromARGB(255, 13, 0, 130)),
        unselectedItemColor: Color.fromARGB(255, 93, 93, 93),
        unselectedLabelStyle:
            TextStyle(fontSize: 15, color: Color.fromARGB(255, 255, 255, 255)),
      ),
    );
  }

  void choiceAction(String choice) {
    if (choice == Constants.Profil) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfilScreen()));
    } else if (choice == Constants.SignOut) {
      logout(context);
    }
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
