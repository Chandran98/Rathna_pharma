import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rathna/models/User_model.dart';
import 'package:rathna/utils/app_url.dart';
import 'package:rathna/utils/hover_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  String _name = "";
  get name => _name;
  String _email = "";
  get email => _email;

  String _city = "";
  get city => _city;
  String _customerid = "";
  get customerid => _customerid;
  Future<Userprofilemodel> getApiCall(context) async {
    SharedPreferences userpref = await SharedPreferences.getInstance();
    var prefservice = await SharedPreferences.getInstance();
    var userid = prefservice.getString("userid");

    try {
      var response = await http.get(Uri.parse(AppURl.userprofileurl + userid));
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var divdata = Userprofilemodel.fromJson(jsonData);
        _name = divdata.customerName;
        userpref.setString("username", divdata.customerName);
        _email = divdata.customerEmail;
        userpref.setString("useremail", divdata.customerEmail);
        _customerid = divdata.customerId;
        userpref.setString("userid", divdata.customerId);
        _city = divdata.customerCity;
        userpref.setString("usercity", divdata.customerCity);
        print(_name);
        notifyListeners();
      } else {
        Utils.toastmessage("Update your profile");
      }
    } catch (e) {}
  }
}

class Userprefservice {
  Future setuserid(userid) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("userid", userid);
  }

  Future getuserid(userid) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // ignore: non_constant_identifier_names
    var userID = pref.getString("userid");
    return userID;
  }

  Future setusername(username) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("username", username);
  }

  Future getusername(username) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // ignore: non_constant_identifier_names
    var username = pref.getString("username");
    return username;
  }

  Future setuseremail(useremail) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("useremail", useremail);
  }

  Future getuseremail(useremail) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // ignore: non_constant_identifier_names
    var useremail = pref.getString("useremail");
    return useremail;
  }

  Future setusercity(usercity) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("usercity", usercity);
  }

  Future getusercity(usercity) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // ignore: non_constant_identifier_names
    var usercity = pref.getString("usercity");
    return usercity;
  }
}
