import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rathna/utils/hover_message.dart';
import 'package:http/http.dart' as http;
import 'package:rathna/view/screens/Forgot_password/otp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/Forgot_password_model.dart';
import '../utils/app_url.dart';

class Forgotpassrepo {
  Future<Forgotpassmodel> forgotpassword(email, context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      Response response;
      var dio = Dio();
      response = await dio.post(AppURl.forgotpass, queryParameters: {
        "customer_email": email,
      });
      if (response.statusCode == 200) {
        var res = Forgotpassmodel.fromJson(response.data);

        pref.setBool("status", res.status);

        // pref.setInt("OTP", res.otp);
        print(response.data);
        print(res.status);
        print(res.otp);
        if (res.status == true) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => OTPscreen()));
        } else {
          Utils.toastmessage("Invalid credentials");
        }
      } else if (response.statusCode==400){
         Utils.toastmessage("Invalid email");
      }
    } catch (e) {
      Utils.toastmessage(e.toString());
      print(e.toString());
    }
  }
}

class OTPPrefservice {
  Future setcredits(otp) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("OTP", otp);
  }

  Future getcredits(
    customerID,
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // ignore: non_constant_identifier_names
    pref.getString("OTP");
  }
}
