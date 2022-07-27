import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rathna/models/Forgot_password_model.dart';
import 'package:rathna/utils/app_url.dart';
import 'package:rathna/utils/hover_message.dart';
import 'package:rathna/view/screens/Forgot_password/otp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Forgotpassprovider extends ChangeNotifier {
  int _otp = 000000;
  String _email="";
  get email=>_email;
  get otp => _otp;
  Future<void> forgotpassword(email, context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      Response response;
      var dio = Dio();
      response = await dio.post(AppURl.forgotpass, queryParameters: {
        "customer_email": email,
      });
      if (response.statusCode == 200) {
        print(email);
        _email=email;
        notifyListeners();
        var res = Forgotpassmodel.fromJson(response.data);

        pref.setBool("status", res.status);
        _otp = res.otp;
        print(_otp);
        notifyListeners();
        if (res.status == true) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => OTPscreen()));
        } else {
          Utils.toastmessage(res.message.toString());
        }
        notifyListeners();
      } else {
        print("error");
      }
    } catch (e) {
      Utils.toastmessage("Invalid email");
      print(e.toString());
    }
  }
}
