// // ignore_for_file: avoid_print

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:rathna/models/login_model.dart';
// import 'package:rathna/utils/app_url.dart';
// import 'package:rathna/utils/hover_message.dart';
// import 'package:rathna/view/screens/home_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// class Authrepo {
//   // ignore: missing_return
//   Future<Loginmodel> login(email, password, context) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     try {
//       Response response;
//       var dio = Dio();
//       response = await dio.post(AppURl.loginurl, queryParameters: {
//         "customer_email": email,
//         "customer_pass": password
//       });
//       if (response.statusCode == 200) {
//         var res = Loginmodel.fromJson(response.data);
//         pref.setString("customerId", res.customerId);

//         pref.setBool("status", res.status);
//         print(response.data);
//         print(res.customerEmail);
//         print(res.customerId);
//         print(res.status);
//         if (res.status == true) {
//           Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (_) => Homescreen()));
//         } else {
//           Utils.toastmessage("Invalid credentials");
//         }
//       } else {
//         print("error");
//       }
//     } catch (e) {
//       Utils.toastmessage(e.toString());
//       print(e.toString());
//     }
//   }
// }

// class Prefservice {
  
//   Future setcredits(customerID) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     pref.setString("customerId", customerID);
//   }

//   Future getcredits(customerID,) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     // ignore: non_constant_identifier_names
//     var ID = pref.getString("customerId");
//     return ID;
//   }

//   Future setstatus(status) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     pref.setBool("status", status);
//   }
//   Future removestatus(status) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     pref.remove("status");
//   }

//   Future getstatus(status) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     // ignore: non_constant_identifier_names
//     var ID = pref.getBool("status");
//     return ID;
//   }
// }
