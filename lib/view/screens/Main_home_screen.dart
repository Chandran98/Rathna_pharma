
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rathna/dummy/home_screen_widget.dart';
import 'package:rathna/models/LR_update_model.dart';
import 'package:rathna/view/screens/covers_page.dart';
import 'package:rathna/view/screens/home_screen.dart';
import 'package:rathna/view/screens/profile_screen.dart';

class MainHomepage extends StatefulWidget {
  MainHomepage({Key key}) : super(key: key);

  @override
  _MainHomepageState createState() => _MainHomepageState();
}

class _MainHomepageState extends State<MainHomepage>
    with TickerProviderStateMixin {
   TabController tabController;
  int selectedIndex = 0;


  @override
  void initState() {
    super.initState();
   

    tabController = TabController(length: 2, vsync: this);
  }

  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainHomepage()));
  }
 List<Widget> pages = [
  Homescreen(),
  Settingscreen(),
];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: pages),

         
          bottomNavigationBar: SizedBox(
            height: kBottomNavigationBarHeight,
            child: BottomAppBar(
              // color: black,
              child: TabBar(
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  indicator:  UnderlineTabIndicator(
                      insets:
                          EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                      borderSide: BorderSide(width: 4, color: primaryTextColor)),
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  unselectedLabelColor: Colors.brown,
                  controller: tabController,
                  // ignore: prefer_const_literals_to_create_immutables
                  tabs: [
                  const  Tab(
                      iconMargin:  EdgeInsets.only(bottom: 4),
                      icon: Icon(CupertinoIcons.home),
                      // icon: selectedIndex == 0
                      //     ? const Icon(Icons.home)
                      //     : const Icon(Icons.home_mini),
                      child: Text(
                        "Home",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                 const   Tab(
                      iconMargin: EdgeInsets.only(bottom: 4),
                      icon: Icon(
                        CupertinoIcons.list_bullet,
                        // size: 25.w,
                      ),
                      child: Text(
                        "Profile",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    
                  ]),
            ),
          )),
    );
  }
}
