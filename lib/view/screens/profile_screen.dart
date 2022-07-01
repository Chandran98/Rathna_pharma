import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rathna/constants/constants.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:rathna/services/auth_services.dart';
import 'package:rathna/theme/colors/color_palette.dart';
import 'package:rathna/view/screens/Login_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../provider/theme_provider.dart';

class Settingscreen extends StatefulWidget {
  const Settingscreen({Key key}) : super(key: key);

  @override
  State<Settingscreen> createState() => _SettingscreenState();
}

class _SettingscreenState extends State<Settingscreen> {
  @override
  Widget build(BuildContext context) {
    final Prefservice prefservice = Prefservice();
    var theme = Provider.of<Themeprovider>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          title: Text(
            "Profile",
            style: TextStyle(color: black),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  theme.toggletheme();
                },
                icon: Icon(CupertinoIcons.moon_stars))
          ],
        ),
        body: ListView(
          padding: EdgeInsets.fromLTRB(15, 20, 20, 50),
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "User Profile",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            spacedh10,
            ListTile(
                title: Text('Dark mode'),
                leading: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Icon(CupertinoIcons.moon_stars,
                      size: 20, color: Colors.white),
                ),
                trailing: Switch(
                    activeColor: Theme.of(context).primaryColor,
                    value: Provider.of<Themeprovider>(context).darktheme,
                    onChanged: (active) {
                      Provider.of<Themeprovider>(context, listen: false)
                          .toggletheme();
                    })),
            // const Divider(
            //   height: 3,
            // ),
            // ListTile(
            //   title: Text('get notifications'),
            //   leading: Container(
            //     height: 30,
            //     width: 30,
            //     decoration: BoxDecoration(
            //         color: Colors.deepPurpleAccent,
            //         borderRadius: BorderRadius.circular(5)),
            //     child: Icon(Icons.notifications_active,
            //         size: 22, color: Colors.white),
            //   ),
            //   // trailing: Switch(
            //   //     activeColor: Theme.of(context).primaryColor,
            //   //     value: context.watch<Notifierprovider>().subscribe,
            //   //     onChanged: (bool) {
            //   //       context.read<Notifierprovider>().fcmSubscribe(bool);
            //   //     }),
            // ),
            Listtilewidget(
              color: Colors.blueAccent,
              ontap: () {
                // Navigator.pushNamed(context, contactroute);
              },
              icon: FeatherIcons.headphones,
              title: 'Contact us',
            ),
            Listtilewidget(
                title: "Log out",
                color: Colors.redAccent,
                ontap: () {
                  prefservice.removestatus("status").then((value) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => Loginscreen()));
                  });
                },
                icon: FeatherIcons.logOut),
            spacedh20,
            const Text(
              "General Settings",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            spacedh20,
            ListTile(
                title: Text('Dark mode'),
                leading: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade600,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Icon(CupertinoIcons.moon_stars,
                      size: 20, color: Colors.white),
                ),
                trailing: Switch(
                    activeColor: Theme.of(context).primaryColor,
                    value: Provider.of<Themeprovider>(context).darktheme,
                    onChanged: (active) {
                      Provider.of<Themeprovider>(context, listen: false)
                          .toggletheme();
                    })),

            Listtilewidget(
              color: Colors.blueAccent,
              ontap: () {
                // Navigator.pushNamed(context, contactroute);
              },
              icon: FeatherIcons.headphones,
              title: 'Contact us',
            ),

            Listtilewidget(
              color: Colors.orangeAccent,
              ontap: () {
                launch(
                    "https://play.google.com/store/apps/details?id=com.indolawassociates.Indolaw");
              },
              icon: FeatherIcons.star,
              title: 'Rate this app',
            ),
            Listtilewidget(
              color: Colors.redAccent,
              ontap: () {
                launch(
                    "https://drive.google.com/file/d/16DRzCPZrXS1EiiU3NFC9ftqkigNaaJYZ/view?usp=sharing");
              },
              icon: FeatherIcons.lock,
              title: 'Privacy policy',
            ),
            Listtilewidget(
              color: Colors.greenAccent,
              ontap: () {
                launch("https://indolawassociates.com/");
              },
              icon: FeatherIcons.info,
              title: 'About us',
            ),
          ],
        ));
  }
}

// ignore: must_be_immutable
class Listtilewidget extends StatelessWidget {
  String title;
  IconData icon;
  VoidCallback ontap;

  Color color;
  Listtilewidget({Key key, this.title, this.color, this.icon, this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          leading: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(5)),
            child: Icon(icon, size: 20, color: Colors.white),
          ),
          trailing: const Icon(
            FeatherIcons.chevronRight,
            size: 20,
          ),
          onTap: ontap,
        ),
        const Divider(
          height: 3,
        )
      ],
    );
  }
}
