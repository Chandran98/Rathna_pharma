import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rathna/constants/constants.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:rathna/helper/Internet%20connectivity/Network_status.dart';
import 'package:rathna/provider/auth_provider.dart';
import 'package:rathna/theme/colors/color_palette.dart';
import 'package:rathna/utils/app_services.dart';
import 'package:rathna/view/screens/Login_screen.dart';
import 'package:rathna/view/screens/Main_home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../provider/theme_provider.dart';
import '../../utils/hover_message.dart';

class Settingscreen extends StatefulWidget {
  const Settingscreen({Key key}) : super(key: key);

  @override
  State<Settingscreen> createState() => _SettingscreenState();
}

class _SettingscreenState extends State<Settingscreen> {
  final Prefservice prefservice = Prefservice();
  void logout(context) {
    var theme = Provider.of<Themeprovider>(context, listen: false);
    showDialog(
        context: (context),
        builder: (_) {
          return AlertDialog(
            title: Text(
              "Do you want to Leave",
              style: GoogleFonts.poppins(
                color: theme.darktheme ? white : black,
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () async {
                    Appservies().checkInternet().then((connection) async {
                      if (connection == false) {
                        Utils.toastmessage("No internet connection");
                      } else {
                        await prefservice.removestatus("status").then((value) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Loginscreen()));
                        });
                      }
                    });
                  },
                  child: const Text(
                    "Ok",
                    style: TextStyle(color: purple),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(_).pop();
                  },
                  child: const Text(
                    "cancel",
                    style: TextStyle(color: purple),
                  )),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    getuserid();
  }

  var useremail = "";
  var username = "";
  getuserid() async {
    var userprefservice = await SharedPreferences.getInstance();
    setState(() {
      useremail = userprefservice.getString("useremail");
      username = userprefservice.getString("username");
    });
  }

  void onback() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => BaseScreen()));
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<Themeprovider>(context);

    return NetworkSensitive(
        child: WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              elevation: 0,
              title: const Text(
                "Profile",
              ),
            ),
            body: ListView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "User Profile",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                spacedh20,
                // const Divider(
                //   height: 3,
                // ),
                ListTile(
                  title: Text(username),
                  subtitle: Text(useremail),
                  leading: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Icon(CupertinoIcons.profile_circled,
                        size: 20, color: Colors.white),
                  ),
                ),
                // ListTile(
                //   title: Text(useremail),
                //   subtitle: const Text('Email'),
                //   leading: Container(
                //     height: 30,
                //     width: 30,
                //     decoration: BoxDecoration(
                //         color: Colors.lightBlue,
                //         borderRadius: BorderRadius.circular(5)),
                //     child: const Icon(CupertinoIcons.mail,
                //         size: 20, color: Colors.white),
                //   ),
                // ),

                spacedh20,
                const Text(
                  "General Settings",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                spacedh20,
                const Divider(
                  height: 3,
                ),
                spacedh10,
                ListTile(
                    title: const Text('Dark mode'),
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
                Listtilewidget(
                    title: "Log out",
                    color: Colors.redAccent,
                    ontap: () {
                      logout(context);
                    },
                    icon: FeatherIcons.logOut),
              ],
            )),
      ),
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
