import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Indicator extends StatelessWidget {
  const Indicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            height: 200,
            width: 250,
            child: Lottie.asset("assets/anim/load.json")));
  }
}
