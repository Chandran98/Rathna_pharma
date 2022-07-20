import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rathna/provider/User_provider.dart';
import 'package:rathna/theme/colors/color_palette.dart';

class Noddys extends StatelessWidget {
  const Noddys({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userprovider = Provider.of<UserProvider>(
      context,
    );
    return Scaffold(
        body: Center(
      child: Container(
        height: 50,
        width: 180,
        color: redColor,
        child: InkWell(
            onTap: () {
              userprovider.getApiCall(context);
            },
            child: Center(child: Text(userprovider.name))),
      ),
    ));
  }
}

class Guide extends StatelessWidget {
  const Guide({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userprovider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: Center(
        child: Text(userprovider.name),
      ),
    );
  }
}
