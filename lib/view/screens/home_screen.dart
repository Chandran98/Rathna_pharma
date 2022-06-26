import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rathna/constants/constants.dart';
import 'package:rathna/dummy/page.dart';
import 'package:rathna/provider/auth_provider.dart';
import 'package:rathna/view/screens/Login_screen.dart';
import 'package:rathna/view/screens/testinga.dart';
import '../../provider/theme_provider.dart';
import '../../services/auth_services.dart';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    final Prefservice prefservice = Prefservice();

    // var authpro = Provider.of<Authprovider>(context);
    var theme = Provider.of<Themeprovider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(5)),
                child: const Icon(CupertinoIcons.moon_stars,
                    size: 20, color: Colors.white),
              ),
              Switch(
                  activeColor: Theme.of(context).primaryColor,
                  value: Provider.of<Themeprovider>(context).darktheme,
                  onChanged: (active) {
                    Provider.of<Themeprovider>(context, listen: false)
                        .toggletheme();
                  })
            ],
          ),
          InkWell(
              onTap: () {
                // Navigator.pushReplacement(
                //     context, MaterialPageRoute(builder: (_) => Testingno()));
              },
              child: Text("data")),
          SizedBox(
            height: 250,
          ),
          InkWell(
              onTap: () {
                prefservice.removestatus("status").then((value) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => Loginscreen()));
                });
              },
              child: Text("Log-out")),
          // InkWell(
          //     onTap: () {
          //       Navigator.pushReplacement(
          //           context, MaterialPageRoute(builder: (_) => Testingno()));
          //     },
          //     child: Text("data"))
        ],
      ),
    );
  }
}
