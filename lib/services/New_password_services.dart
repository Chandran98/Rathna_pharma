import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rathna/utils/app_url.dart';
import 'package:rathna/utils/hover_message.dart';
import 'package:rathna/view/screens/Main_home_screen.dart';

class Newpasswordrepo {
  // ignore: missing_return
  Future<void> updatepassword(email, password, context) async {
    try {
      Response response;
      var dio = Dio();
      print(email);
      print(password);
      response = await dio.put(AppURl.newpassword, queryParameters: {
        "customer_email": email,
        "customer_pass": password
      });
      if (response.statusCode == 200) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => MainHomepage()));
        Utils.toastmessage("Password changed successfully");
      } else {
        Utils.toastmessage("Something went wrong");
      }
    } catch (e) {
      Utils.toastmessage(e.toString());
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
