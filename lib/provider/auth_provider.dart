import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rathna/models/login_model.dart';
import 'package:rathna/utils/app_url.dart';
import 'package:rathna/view/screens/Main_home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/hover_message.dart';

class Authprovider extends ChangeNotifier {
  Loginmodel loginmodel;
  String _customerId = "";
  get customerId => _customerId;
  String _useridcomm = "";
  get useridcomm => _useridcomm;
  bool _status;
  get status => _status;
  bool _loading = false;
  get loading => _loading;

  setloading(value) {
    _loading = value;
    notifyListeners();
  }

  // ignore: missing_return
  Future<Loginmodel> login(String email, String password, context) async {
    setloading(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      Response response;
      var dio = Dio();
      response = await dio.post(AppURl.loginurl, queryParameters: {
        "customer_email": email,
        "customer_pass": password
      });
      if (response.statusCode == 200) {
        setloading(false);
        var res = response.data;

        loginmodel = Loginmodel.fromJson(res);
        pref.setBool("status", loginmodel.status);
        pref.setString("userid", loginmodel.customerId);
        _customerId = loginmodel.customerId;
        _status = loginmodel.status;
        _useridcomm = pref.getString(
          "userid",
        );
        print(pref.getString(
          "userid",
        ));

        notifyListeners();
        if (loginmodel.status == true) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => BaseScreen()));
        } else {
          Utils.toastmessage("Invalid credentials");
        }
        notifyListeners();

        // Utils.toastmessage(response.data.toString());
      } else {
        Utils.toastmessage("Invalid credentials");
      }
    } catch (e) {
      Utils.toastmessage("Invalid credentials");
      setloading(false);
      print(e.toString());
    }
  }
}




class Prefservice {
  Future setstatus(status) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("status", status);
  }

  Future removestatus(status) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("status");
  }

  Future getstatus(status) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // ignore: non_constant_identifier_names
    var ID = pref.getBool("status");
    return ID;
  }

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
}
