import 'package:flutter/material.dart';
import 'package:rathna/constants/constants.dart';
import 'package:rathna/helper/Internet%20connectivity/Network_status.dart';
import 'package:rathna/view/screens/Main_home_screen.dart';

class QueryDetailscreen extends StatelessWidget {
  const QueryDetailscreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onback() {
      Navigator.push(context, MaterialPageRoute(builder: (_) => BaseScreen()));
    }

    return NetworkSensitive(
      child: WillPopScope(
        onWillPop: () {
          onback();
          return Future.value(false);
        },
        child: Scaffold(
          body: Container(),
        ),
      ),
    );
  }
}
