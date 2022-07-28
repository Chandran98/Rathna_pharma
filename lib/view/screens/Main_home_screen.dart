import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rathna/constants/constants.dart';
import 'package:rathna/provider/theme_provider.dart';
import 'package:rathna/theme/colors/color_palette.dart';
import 'package:rathna/view/screens/all_query_screen.dart';
import 'package:rathna/view/screens/home_screen.dart';
import 'package:rathna/view/screens/profile_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FeaturedScreen(),
    QueryDetailscreen(),
    Settingscreen(),
  ];
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<Themeprovider>(context);
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kPrimaryColor,
          backgroundColor: theme.darktheme ? Colors.black45 : white,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                icFeatured,
                height: kBottomNavigationBarItemSize,
              ),
              icon: Image.asset(
                icFeaturedOutlined,
                height: kBottomNavigationBarItemSize,
              ),
              label: "Home",
            ),
            const BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.question_answer_sharp,
                size: kBottomNavigationBarItemSize,
              ),
              icon: Icon(
                Icons.question_answer_outlined,
                size: kBottomNavigationBarItemSize,
              ),
              label: "Query",
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                icSetting,
                height: kBottomNavigationBarItemSize,
              ),
              icon: Image.asset(
                icSettingOutlined,
                height: kBottomNavigationBarItemSize,
              ),
              label: "Settings",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
