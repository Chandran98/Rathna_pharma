import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rathna/constants/constants.dart';
import 'package:rathna/helper/Internet%20connectivity/connectivity.dart';

class NetworkSensitive extends StatelessWidget {
  final double opacity;
  final Widget child;
   NetworkSensitive({ this.child, this.opacity = 1});
// ignore: empty_constructor_bodies

  @override
  Widget build(BuildContext context) {
    var connectionstatus = Provider.of<ConnectivityStatus>(context);

    if (connectionstatus == ConnectivityStatus.Wifi) {
      return child;
    }
    if (connectionstatus == ConnectivityStatus.Mobile) {
      return child;
    }

    return SafeArea(
      child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Image.asset("assets/icons/error2.png"),
        ),
        spacedh30,
        const Padding(
          padding:  EdgeInsets.all(8.0),
          child: Text(
            "Something went wrong! \nPlease check your internet connection",
            textAlign: TextAlign.center,
          ),
        )
      ],
    )
    );
  }
}
