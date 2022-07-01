import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rathna/services/auth_services.dart';
import 'package:rathna/view/screens/Login_screen.dart';
import 'package:rathna/view/screens/home_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  final Prefservice prefservice = Prefservice();

  @override
  void initState() {
    prefservice.getstatus("status").then((value) {
      print(value);
      if (value == true) {
        return Timer(const Duration(seconds: 2),(() => 
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Homescreen()))));
      } else {
          return Timer(const Duration(seconds: 2),(() => 
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Loginscreen()))));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Image.asset('assets/images/rathna.jpg'),
      ),
    );
  }
}
