import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:rtmapp1/models/user.dart';
import 'package:rtmapp1/models/user_model.dart';
import 'package:rtmapp1/screens/home_screen.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
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
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text("Profil"),
        centerTitle: true,
        // backgroundColor: Color.fromARGB(255, 0, 92, 167),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Profil",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
