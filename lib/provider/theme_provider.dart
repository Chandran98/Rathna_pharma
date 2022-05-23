import 'package:flutter/material.dart';
import 'package:rathna/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class  Themeprovider extends ChangeNotifier{
  final SharedPreferences sharedPreferences;
  Themeprovider ({@required this.sharedPreferences}){loadtheme();}

  bool _darktheme= true;
  bool get darktheme=> _darktheme;
  void switchtheme(){
    _darktheme =!_darktheme;
    sharedPreferences.setBool(Appconstants.Theme,_darktheme);
    notifyListeners();
  }
  void loadtheme()async{
    sharedPreferences.getBool(Appconstants.Theme )??false;
    notifyListeners();
  }
}