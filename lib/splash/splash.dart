import 'package:flutter/material.dart';
import 'package:rtmapp1/screens/login_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _navigatetohome();
    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.pushReplacement(context,
    //       MaterialPageRoute(builder: (context) => const LoginScreen()));
    // });
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(seconds: 2), () {});

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      child: Text('Splash Screen', style: TextStyle(fontSize: 24)),
    )));
  }
}
