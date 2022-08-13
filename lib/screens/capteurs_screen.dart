import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rtmapp1/screens/home_screen.dart';

class CapteursScreen extends StatefulWidget {
  const CapteursScreen({super.key});

  @override
  State<CapteursScreen> createState() => _CapteursScreenState();
}

class _CapteursScreenState extends State<CapteursScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Capteurs"),
        centerTitle: true,
        // backgroundColor: Colors.transparent,
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
                "Capteurs",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
