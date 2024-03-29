// ignore_for_file: prefer_const_constructors

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
  void displayAlertDialog1() {
    var theme = Provider.of<Themeprovider>(context, listen: false);
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(
          'Logout?',
          style: GoogleFonts.poppins(
            color: theme.darktheme ? white : black,
          ),
        ),
        content: Text(
          'Are you sure want to logout?',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: theme.darktheme ? white : black,
          ),
        ),
        actions: [
          CupertinoDialogAction(
            child: Text(
              'Cancel',
              style: GoogleFonts.poppins(color: kPrimaryColor, fontSize: 16),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text(
              'Logout',
              style: GoogleFonts.poppins(color: kPrimaryColor, fontSize: 16),
            ),
            onPressed: () {
              Appservies().checkInternet().then((connection) async {
                if (connection == false) {
                  Utils.toastmessage("No internet connection");
                } else {
                  await prefservice.removestatus("status").then((value) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const Loginscreen()));
                  });
                }
              });
            },
          )
        ],
      ),
    );
  }

  void boxfunction() {
    var theme = Provider.of<Themeprovider>(context, listen: false);
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(
          'Contact Us',
          style: GoogleFonts.poppins(
            color: theme.darktheme ? white : black,
          ),
        ),
        content: Text(
          'Do you have any queries just contact Us ?',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: theme.darktheme ? white : black,
          ),
        ),
        actions: [
          CupertinoDialogAction(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.phone,
                  size: 45,color: kPrimaryColor,
                ),
                Text(
                  'Call  us',
                  style: GoogleFonts.poppins(fontSize: 32, color:kPrimaryColor),
                ),
              ],
            ),
            onPressed: () {
             launch("tel: 04467480500");
            },
          ),
          CupertinoDialogAction(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.mail,
                  size: 45,color: kPrimaryColor,
                ),
                Text(
                  'Mail Us',
                  style: GoogleFonts.poppins(fontSize: 32, color:kPrimaryColor),
                ),
              ],
            ),
            // ignore: deprecated_member_use
            onPressed: () {launch("mailto: indolawassociates@gmail.com");},
          ),
          CupertinoDialogAction(
            child: Row(  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Icon(
                  Icons.cancel_outlined,
                  size: 45,color: redColor,
                ),
                Text(
                  'Cancel',
                  style: GoogleFonts.poppins(fontSize: 32, color: redColor),
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
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
              leading: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => BaseScreen()));
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: white,
                  )),
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
                    title: Text(
                      'Dark mode',
                      style: GoogleFonts.poppins(),
                    ),
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
                    boxfunction();
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
                  color: Colors.greenAccent,
                  ontap: () {
                    launch(
                        "https://drive.google.com/file/d/16DRzCPZrXS1EiiU3NFC9ftqkigNaaJYZ/view?usp=sharing");
                  },
                  icon: FeatherIcons.lock,
                  title: 'Privacy policy',
                ),
                // Listtilewidget(
                //   color: Colors.greenAccent,
                //   ontap: () {
                //     launch("https://indolawassociates.com/");
                //   },
                //   icon: FeatherIcons.info,
                //   title: 'About us',
                // ),
                Listtilewidget(
                    title: "Log out",
                    color: Colors.redAccent,
                    ontap: () {
                      // logout(context);
                      displayAlertDialog1();
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
          title: Text(
            title,
            style: GoogleFonts.poppins(),
          ),
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
