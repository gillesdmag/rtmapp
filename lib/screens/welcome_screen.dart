import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:rtmapp1/models/user.dart';
import 'package:rtmapp1/models/user_model.dart';
import 'package:rtmapp1/screens/home_screen.dart';
import 'package:rtmapp1/screens/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String dropdownValue = 'Autorité';
  List listItem = ["Autorité", "Admin"];
  final List<String> statusItems = [
    'Autorité',
    'Admin',
  ];

  String? selectedValue;
  //form key
  final _formKey = GlobalKey<FormState>();

  // edition controller
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController statusController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confPasswordController =
      new TextEditingController();

  final _auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back,
      //       color: Colors.blue,
      //     ),
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //   ),
      // ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Welcome back",
                style: TextStyle(fontSize: 15),
              ),
              ActionChip(
                backgroundColor: Colors.redAccent,
                label: Text(
                  "Connexion",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
