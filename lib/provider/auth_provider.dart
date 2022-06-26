import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rathna/models/login_model.dart';
import 'package:rathna/view/screens/home_screen.dart';

import '../utils/hover_message.dart';

class Authprovider extends ChangeNotifier {
  Loginmodel loginmodel;
  String customerId="";
  bool _loading = false;
  get loading => _loading;

  setloading(value) {
    _loading = value;
    notifyListeners();
  }

  // ignore: missing_return
  Future<Loginmodel> login(String email, String password, context) async {
    setloading(true);
    try {
      String url = "https://libsitservices.com/core/api/customer/login";
      Response response;
      var dio = Dio();
      response = await dio.post(url, queryParameters: {
        "customer_email": email,
        "customer_pass": password
      });
      if (response.statusCode == 200) {
        setloading(false);
        print(response.data);
        var res = response.data;

      loginmodel = Loginmodel.fromJson(res);
      customerId=loginmodel.customerId ;
      notifyListeners();
       print(loginmodel.customerId);
       print(loginmodel.customerEmail);
       print(customerId);
        if (loginmodel.status == true) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => Homescreen()));
        } else {
          Utils.toastmessage("Invalid credentials");
        }
        notifyListeners();

        // Utils.toastmessage(response.data.toString());
      } else {
        print("error");
      }
    } catch (e) {
      setloading(false);
      print(e.toString());
    }
  }
}
