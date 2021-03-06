import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rathna/provider/auth_provider.dart';
import 'package:rathna/view/screens/Login_screen.dart';
import 'package:rathna/view/screens/Main_home_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  final Prefservice prefservice = Prefservice();

  @override
  void initState() {
    prefservice.getstatus("status").then((value) async {
      var data = await prefservice.getuserid("userid");
      print(data);
      setState(() {
        Provider.of<Authprovider>(context, listen: false);
      });
      print(value);
      if (value == true) {
        return Timer(
            const Duration(seconds: 2),
            (() => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => BaseScreen()))));
      } else {
        return Timer(
            const Duration(seconds: 2),
            (() => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => Loginscreen()))));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/rathna.png',
          scale: 2.5,
        ),
      ),
    );
  }
}
