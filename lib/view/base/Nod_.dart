
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rathna/provider/User_provider.dart';

class Noddys extends StatelessWidget {
  const Noddys({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userprovider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
        body: Center(
      child: InkWell(
          onTap: () {
            userprovider.getApiCall(context);
          },
          child: const Text("data")),
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
